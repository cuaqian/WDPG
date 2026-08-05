# Knowledge graph reconstruction protocol

## Layers

The graph uses three layers:

- document resource layer
- corpus indexing layer
- structured knowledge layer

The document layer stores source metadata. The corpus layer stores retrievable text fragments. The structured layer stores standardized entities and treatment relations.

## Reconstruction inputs

To reconstruct the graph, a researcher needs:

- source document metadata
- parsed text chunks
- extraction schema and prompt
- normalization rules
- node and relation schema
- Cypher write templates

This package provides schema and Cypher templates. Full source documents may require separate sharing because some sources have redistribution restrictions.

## Quality checks

Recommended quality checks:

- entity extraction Precision, Recall, F1 on an expert-labeled sample
- relation extraction Precision, Recall, F1 on an expert-labeled sample
- task coverage of the four actionable categories
- prescription field completeness
- provenance accuracy based on sampled source checks

The manuscript can use downstream prescription performance as task evidence. Extraction metrics should be reported separately if they are added in revision.
