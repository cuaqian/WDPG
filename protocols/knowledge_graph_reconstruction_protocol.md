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

## Quality-Control Scope

The current package documents the graph schema, extraction prompt, normalization rules, and reconstruction protocol. More fine-grained independent graph evaluation can be conducted using:

- entity extraction Precision, Recall, F1 on an expert-labeled sample
- relation extraction Precision, Recall, F1 on an expert-labeled sample
- task coverage of the four actionable categories
- prescription field completeness
- provenance accuracy based on sampled source checks

These graph-level metrics are listed as future audit items for deployments that rebuild the graph from the complete source corpus and local Neo4j database.
