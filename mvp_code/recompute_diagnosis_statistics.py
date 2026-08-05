#!/usr/bin/env python3
"""Recompute diagnosis metrics, bootstrap CI, and McNemar test from JSONL predictions.

This script intentionally uses only the Python standard library so reviewers can
run it without installing the full WDPG-AGENT environment.
"""

from __future__ import annotations

import argparse
import json
import math
import random
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


def _read_jsonl(path: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    with path.open("r", encoding="utf-8", errors="replace") as f:
        for line in f:
            line = line.strip()
            if line:
                rows.append(json.loads(line))
    return rows


def _predicted_label(row: dict[str, Any]) -> str:
    prediction = row.get("prediction") or {}
    diagnosis = row.get("diagnosis") or {}
    candidates = [
        prediction.get("predicted_label"),
        diagnosis.get("canonical_name"),
        diagnosis.get("threat_kind"),
        prediction.get("label"),
    ]
    for value in candidates:
        if isinstance(value, str) and value.strip():
            return value.strip()
    return ""


def _sample_key(row: dict[str, Any]) -> str:
    for key in ("image_id", "path", "resolved_path", "i"):
        value = row.get(key)
        if value is not None:
            return str(value)
    return json.dumps(row, ensure_ascii=False, sort_keys=True)


def _label_pairs(rows: list[dict[str, Any]]) -> list[tuple[str, str, str]]:
    pairs: list[tuple[str, str, str]] = []
    for row in rows:
        gold = str(row.get("true_label", "")).strip()
        pred = _predicted_label(row)
        key = _sample_key(row)
        if gold:
            pairs.append((key, gold, pred))
    return pairs


def _accuracy(pairs: list[tuple[str, str, str]]) -> float:
    if not pairs:
        return float("nan")
    return sum(1 for _, gold, pred in pairs if gold == pred) / len(pairs)


def _macro_prf(pairs: list[tuple[str, str, str]]) -> tuple[float, float, float]:
    labels = sorted({gold for _, gold, _ in pairs} | {pred for _, _, pred in pairs if pred})
    if not labels:
        return float("nan"), float("nan"), float("nan")
    precisions: list[float] = []
    recalls: list[float] = []
    f1s: list[float] = []
    for label in labels:
        tp = sum(1 for _, gold, pred in pairs if gold == label and pred == label)
        fp = sum(1 for _, gold, pred in pairs if gold != label and pred == label)
        fn = sum(1 for _, gold, pred in pairs if gold == label and pred != label)
        precision = tp / (tp + fp) if tp + fp else 0.0
        recall = tp / (tp + fn) if tp + fn else 0.0
        f1 = (2 * precision * recall / (precision + recall)) if precision + recall else 0.0
        precisions.append(precision)
        recalls.append(recall)
        f1s.append(f1)
    return sum(precisions) / len(precisions), sum(recalls) / len(recalls), sum(f1s) / len(f1s)


def _bootstrap_ci(values: list[int], rounds: int, seed: int) -> tuple[float, float]:
    if not values:
        return float("nan"), float("nan")
    rng = random.Random(seed)
    n = len(values)
    scores = []
    for _ in range(rounds):
        sample_sum = sum(values[rng.randrange(n)] for _ in range(n))
        scores.append(sample_sum / n)
    scores.sort()
    lo_idx = int(0.025 * (rounds - 1))
    hi_idx = int(0.975 * (rounds - 1))
    return scores[lo_idx], scores[hi_idx]


def _binom_two_sided_p(k: int, n: int) -> float:
    if n == 0:
        return 1.0
    observed = min(k, n - k)
    prob = sum(math.comb(n, i) for i in range(observed + 1)) / (2**n)
    return min(1.0, 2 * prob)


def _mcnemar(primary: list[tuple[str, str, str]], compare: list[tuple[str, str, str]]) -> dict[str, Any]:
    compare_by_key = {key: (gold, pred) for key, gold, pred in compare}
    b = 0
    c = 0
    paired = 0
    for key, gold_a, pred_a in primary:
        if key not in compare_by_key:
            continue
        gold_b, pred_b = compare_by_key[key]
        if gold_a != gold_b:
            continue
        a_correct = pred_a == gold_a
        b_correct = pred_b == gold_b
        paired += 1
        if a_correct and not b_correct:
            b += 1
        elif not a_correct and b_correct:
            c += 1
    n = b + c
    chi2 = ((abs(b - c) - 1) ** 2 / n) if n else 0.0
    return {
        "paired_samples": paired,
        "primary_correct_compare_wrong": b,
        "primary_wrong_compare_correct": c,
        "mcnemar_chi2_with_continuity": chi2,
        "exact_binomial_p_two_sided": _binom_two_sided_p(b, n),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--predictions", required=True, type=Path)
    parser.add_argument("--compare", type=Path)
    parser.add_argument("--bootstrap", type=int, default=1000)
    parser.add_argument("--seed", type=int, default=13)
    args = parser.parse_args()

    rows = _read_jsonl(args.predictions)
    pairs = _label_pairs(rows)
    correct = [1 if gold == pred else 0 for _, gold, pred in pairs]
    precision, recall, f1 = _macro_prf(pairs)
    lo, hi = _bootstrap_ci(correct, args.bootstrap, args.seed)

    label_counts = Counter(gold for _, gold, _ in pairs)
    pred_counts = Counter(pred for _, _, pred in pairs)
    confusion = defaultdict(Counter)
    for _, gold, pred in pairs:
        confusion[gold][pred] += 1

    output: dict[str, Any] = {
        "file": str(args.predictions),
        "n": len(pairs),
        "accuracy": _accuracy(pairs),
        "accuracy_bootstrap_95ci": [lo, hi],
        "macro_precision": precision,
        "macro_recall": recall,
        "macro_f1": f1,
        "label_counts": dict(label_counts),
        "prediction_counts": dict(pred_counts),
        "confusion": {gold: dict(preds) for gold, preds in confusion.items()},
    }

    if args.compare:
        compare_rows = _read_jsonl(args.compare)
        compare_pairs = _label_pairs(compare_rows)
        paired = _mcnemar(pairs, compare_pairs)
        if paired["paired_samples"] != len(pairs):
            paired["warning"] = (
                "McNemar's test is reliable only when both files contain the same sample IDs. "
                "The current files are only partially paired."
            )
        output["paired_comparison"] = paired

    print(json.dumps(output, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
