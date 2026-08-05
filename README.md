# WDPG-AGENT review-facing MVP

This repository snapshot is intended for editor and reviewer inspection during manuscript revision.

It contains the minimum code and saved-result materials needed to inspect the WDPG-AGENT workflow and recompute the main saved-result metrics. It is designed for an author-controlled GitHub repository rather than journal Supplementary Materials, because code and run guides may need versioned updates during review.

## Included

- Final optimized visual diagnosis prompt.
- Prompt search summary, selection record, and BASE/BEST metric files.
- Reviewed prescription-library summary, field schema, and four representative examples.
- Direct/base prescription reference count summary.
- Retrieval configuration and environment template without credentials.
- Knowledge graph schema, extraction prompt template, normalization rules, and Cypher templates.
- MVP single-image entry script.
- Saved prediction files and metric files.
- Metric recomputation script.
- Data split, evaluation, expert review, and knowledge graph reconstruction protocols.

## Not included

- Full production agent repository.
- Full DSPy prompt-search engineering code.
- Complete machine-readable prescription library files, unless the editor requests a controlled review copy.
- Full knowledge graph construction pipeline.
- Complete Neo4j database dump.
- Milvus index files.
- API keys, passwords, private service URLs, and local deployment scripts.
- Raw images with redistribution restrictions.
- Expert personal signatures.

The full maintained engineering repository will be released after acceptance/publication after removing credentials, private deployment settings, and restricted raw data.
