# File manifest

## Package-level files

| File | Purpose |
|---|---|
| `README.md` | Scope and sharing boundary of the review-facing MVP repository. |
| `FILE_MANIFEST.md` | File-level manifest. |
| `MATERIAL_STATUS.md` | Status table for provided, conditionally shared, and excluded materials. |
| `PACKAGE_LIMITS.md` | Package boundary and statistical caveat. |

## Prompt and DSPy records

| File | Purpose |
|---|---|
| `prompts/best_prompt.json` | Final optimized diagnostic prompt loaded by the Diagnostic agent. |
| `prompts/search.summary.json` | Summary of the prompt search process. |
| `prompts/closed6_selection.summary.json` | Selection summary for the six-class closed-set diagnosis task. |
| `prompts/baseline.dev.metrics.json` | Development-set metrics for the baseline prompt. |
| `prompts/baseline.test.metrics.json` | Test-set metrics for the baseline prompt. |
| `prompts/optimized.closed6.test.metrics.json` | Test-set metrics for the selected DSPy prompt. |

## Prescription library

| File | Purpose |
|---|---|
| `prescription_library/summary.json` | Count summary, interpretation, and four representative examples. |
| `prescription_library/README.md` | Field definitions and use boundary. |
| `prescription_library/expert_review_protocol.md` | De-identified expert review protocol. |
| `prescription_library/expert_review_summary.json` | De-identified review summary and disagreement-resolution rule. |

## Results

| File | Purpose |
|---|---|
| `results/metrics/*.json` | Main saved metric files. |
| `results/predictions/*.jsonl` | Per-sample saved predictions used for metric recomputation. |

## Protocols and configuration

| File | Purpose |
|---|---|
| `configs/env.template.sh` | Environment variable template without credentials. |
| `configs/retrieval_config.json` | Retrieval, fusion, rerank, and DeepResearch settings. |
| `protocols/*.md` | Evaluation, data split, expert review, DSPy, and KG reconstruction protocols. |
| `kg_schema/schema.md` | Knowledge graph node, relation, and field schema. |
| `kg_schema/cypher_templates.cypher` | Main Cypher templates for graph scale checks and treatment relation inspection. |
| `kg_schema/extraction_prompt_template.md` | Structured extraction prompt template for graph-ready knowledge units. |
| `kg_schema/normalization_rules.md` | Entity, dosage, PHI, provenance, and deduplication rules. |

## MVP code

| File | Purpose |
|---|---|
| `mvp_code/run_wdpd_full_agent.sh` | Single-image MVP agent entry. Requires deployed model services. |
| `mvp_code/recompute_diagnosis_statistics.py` | Standard-library script for diagnosis metrics, bootstrap CI, and McNemar test. |
| `mvp_code/README.md` | MVP code boundary and run instructions. |
