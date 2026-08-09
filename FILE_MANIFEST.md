# File Manifest

## Package-Level Files

| File | Purpose |
|---|---|
| `README.md` | Scope and sharing boundary of the review-facing reproducibility materials. |
| `FILE_MANIFEST.md` | File-level manifest. |

## Prompt

| File | Purpose |
|---|---|
| `prompts/best_prompt.json` | Final optimized diagnostic prompt loaded by the Diagnostic agent. |

## Configuration

| File | Purpose |
|---|---|
| `configs/env.template.sh` | Environment variable template without credentials. |
| `configs/retrieval_config.json` | Retrieval, fusion, reranking, and DeepResearch configuration. |

## Dataset Metadata

| File | Purpose |
|---|---|
| `dataset_metadata/class_source_split_summary.csv` | Class-wise source composition and train/validation/test split counts. |
| `dataset_metadata/README.md` | Dataset metadata boundary and raw-image sharing note. |

## Knowledge-Graph Materials

| File | Purpose |
|---|---|
| `kg_schema/schema.md` | Knowledge-graph node, relation, and field schema. |
| `kg_schema/cypher_templates.cypher` | Cypher templates for graph scale checks and treatment relation inspection. |
| `kg_schema/extraction_prompt_template.md` | Structured extraction prompt template for graph-ready knowledge units. |
| `kg_schema/normalization_rules.md` | Entity, dosage, PHI, provenance, and deduplication rules. |

## Prescription-Library Materials

| File | Purpose |
|---|---|
| `prescription_library/summary.json` | Prescription-library construction summary and representative examples. |
| `prescription_library/README.md` | Field definitions and use boundary. |
| `prescription_library/expert_review_protocol.md` | De-identified expert-review protocol. |
| `prescription_library/expert_review_summary.json` | De-identified review summary and disagreement-resolution rule. |

## Protocols

| File | Purpose |
|---|---|
| `protocols/data_split_and_leakage_protocol.md` | Data split, leakage-control, and held-out evaluation boundary. |
| `protocols/dspy_prompt_optimization_protocol.md` | DSPy prompt optimization and prompt-selection protocol. |
| `protocols/evaluation_protocol.md` | Diagnosis and prescription evaluation protocol. |
| `protocols/expert_review_protocol.md` | Expert-review protocol summary. |
| `protocols/knowledge_graph_reconstruction_protocol.md` | Knowledge-graph reconstruction protocol. |
