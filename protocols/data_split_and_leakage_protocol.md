# Data split and leakage control protocol

## Split design

The image dataset contains 1489 samples. It is divided into training, validation, and test splits at a 3:3:4 ratio.

- Training split: used for error analysis and candidate prompt design.
- Validation split: used for prompt candidate selection.
- Test split: 601 samples reserved for final evaluation.

The test split is not used for prompt selection, model tuning, retrieval parameter selection, or prescription library construction decisions.

## Non-actionable classes

Healthy and other samples are included in the full-process test set to evaluate safe non-prescription behavior. For these samples, returning an empty prescription is counted as correct. This rule is applied to all evaluated models.

## Duplicate and near-duplicate checks

Before submission, the following checks should be reported:

- exact file hash duplicate check
- perceptual hash or image similarity check
- manual review of suspicious near duplicates
- confirmation that no identical or highly similar images cross train, validation, and test splits

## Public pretraining overlap

Public web images may overlap with unknown pretraining corpora of large multimodal models. This risk cannot be fully audited for closed-source or large-scale models. The manuscript should state this limitation clearly.

The same test images and evaluation rules are used for all compared models. This supports controlled relative comparison. Absolute accuracy should be interpreted with the pretraining-overlap limitation in mind.

