# Package status and sharing boundary

This package is a review-facing MVP reproducibility package. It is designed to let reviewers inspect the workflow, verify the main saved-result metrics, and check the core knowledge and prescription resources without exposing private deployment assets.

## Included in this package

- Optimized diagnostic prompt and DSPy prompt search records.
- Final DeepResearch-enhanced prescription-library summary: 35 usable recommendation entries, with four representative examples in `prescription_library/summary.json`.
- Direct/base prescription construction reference summary: 24 reviewed entries in `prescription_library/summary.json`.
- Saved predictions and metrics for the available main comparison files.
- MVP diagnosis metric recomputation script.
- Retrieval configuration with fixed top-k values, fusion weights, reranking settings, and DeepResearch limits.
- Environment variable template without credentials.
- Knowledge graph schema, Cypher templates, scale queries, and reconstruction protocol.
- Expert review protocol and data split/leakage control protocol.

## Not included as public files

| Material | Public handling |
|---|---|
| Full production repository | Not included in the review-facing MVP package. A maintained repository can be released after acceptance or publication. |
| API keys, Neo4j password, private service URLs | Excluded. `configs/env.template.sh` gives placeholders and variable names. |
| Complete Neo4j database instance | Excluded. The package provides schema, Cypher templates, reconstruction protocol, and graph scale queries. A four-category task subgraph export can be supplied if the editor requests graph-level inspection. |
| Complete machine-readable prescription library | Excluded from the public MVP. A controlled item-level review copy can be supplied if the editor requests it. |
| Raw web-source images with redistribution restrictions | Handled through sample IDs, labels, split information, source metadata, and hash-based duplicate records in the formal supplementary upload. |
| Expert personal signatures | Not public. The formal supplementary upload should use a de-identified expert review summary. |

## Statistical analysis note

The included script can compute bootstrap confidence intervals from saved predictions. McNemar's test requires two prediction files with the same sample IDs. The currently copied baseline prediction files contain 601 rows each, but only 190 sample IDs overlap with the copied WDPG file. Do not report McNemar results in the manuscript until the final paired prediction files are aligned on the same 601 test samples.
