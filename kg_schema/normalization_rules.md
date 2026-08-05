# Knowledge graph normalization rules

This file summarizes the field-normalization rules used before graph writing. The rules are provided to make the graph construction boundary auditable without releasing the complete Neo4j database or all intermediate extraction records.

## Entity normalization

- Map wheat pest and disease names to controlled canonical names when aliases refer to the same target.
- Keep `Threat.kind` as one of `disease`, `pest`, `healthy`, `other`, or `unknown`.
- Merge duplicate `Threat` nodes by `canonical_name`.
- Merge duplicate `Pesticide` nodes by normalized pesticide name and formulation when both are available.
- Preserve the original formulation string in `Pesticide.formulation`.
- Store active ingredients separately when they can be identified from the pesticide name or source text.

## Dosage normalization

- Keep the original dosage expression in the evidence text.
- Convert common area units to a per-mu representation when the source explicitly supports the conversion.
- Preserve dosage ranges instead of forcing a single scalar value.
- Split application method, water volume, interval, and maximum application count into separate fields when explicitly available.
- Leave unsupported fields empty or `null`; do not infer missing dosage values.

## PHI normalization

- Convert explicit pre-harvest interval values into integer `PHI.days`.
- Store non-numeric or conditional PHI descriptions in `PHI.note`.
- Do not create a PHI relation when the source text does not state a PHI.

## Provenance and deduplication

- Every extracted entity or relation should retain `doc_id` and `chunk_id` provenance when source evidence is available.
- Duplicate relations are merged by the tuple of canonical head node, relation type, canonical tail node, and provenance.
- Neo4j `MERGE` is used for idempotent node and relation writing.
- Source metadata is stored in `Document`; retrievable text evidence is stored in `Chunk`.

## Safety filtering boundary

- High-risk, forbidden, or unsupported pesticide recommendations are not promoted into the reviewed prescription set.
- Graph construction stores source-supported knowledge; prescription use requires later field checking and expert review.

