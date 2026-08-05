# Knowledge graph schema

## Node types

| Node type | Main fields | Description |
|---|---|---|
| `Document` | `doc_id`, `title`, `source_type`, `date`, `url` | Original source metadata. |
| `Chunk` | `chunk_id`, `doc_id`, `text`, `section`, `tags` | Retrieval unit created from source documents. |
| `Threat` | `name`, `canonical_name`, `kind`, `aliases` | Wheat disease or pest target. |
| `Pesticide` | `name`, `formulation`, `active_ingredient` | Pesticide product or formulation. |
| `Dosage` | `value`, `unit`, `method`, `water_volume` | Dose and application information. |
| `PHI` | `days`, `note` | Pre-harvest interval information. |
| `Symptom` | `name`, `description` | Symptom evidence. |
| `GrowthStage` | `name`, `description` | Wheat growth stage or application timing. |

## Relation types

| Relation | Head | Tail | Description |
|---|---|---|---|
| `HAS_CHUNK` | `Document` | `Chunk` | Links source documents to retrievable chunks. |
| `MENTIONS` | `Chunk` | entity nodes | Links evidence chunks to extracted entities. |
| `HAS_SYMPTOM` | `Threat` | `Symptom` | Diagnostic symptom relation. |
| `CONTROLLED_BY` | `Threat` | `Pesticide` | Pesticide can control the target threat. |
| `HAS_DOSAGE` | `Pesticide` | `Dosage` | Dosage and method constraint. |
| `HAS_PHI` | `Pesticide` | `PHI` | PHI constraint. |
| `APPLIES_AT` | `Pesticide` | `GrowthStage` | Growth stage or timing constraint. |
| `SUPPORTED_BY` | entity or relation node | `Chunk` | Provenance support. |

## Scale reported in the manuscript

| Layer | Storage object | Count |
|---|---:|---:|
| document resource layer | documents | 5263 |
| corpus indexing layer | text fragments | 4391 |
| structured knowledge layer | standardized entities | 4933 |
| structured knowledge layer | standardized relations | 9427 |

