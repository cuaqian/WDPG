# Knowledge extraction prompt template

This template documents the structured extraction interface used to convert an agricultural text chunk into graph-ready knowledge units. It is provided for reproducibility of the schema and field design. It is not a dump of all source chunks or all extracted records.

## Input

- `doc_id`: source document identifier
- `chunk_id`: text chunk identifier
- `title`: source title
- `source_type`: source category, such as official guidance, standard, article, book, patent, or extension material
- `date`: source publication date if available
- `url`: source URL if available
- `text`: source text chunk

## Task

Extract wheat pest and disease diagnosis and control knowledge from the given text chunk. Return only structured JSON that follows the output schema. Do not infer pesticide dosage, PHI, target object, or application timing if the text chunk does not support them.

## Output schema

```json
{
  "threats": [
    {
      "name": "",
      "canonical_name": "",
      "kind": "disease|pest|healthy|other|unknown",
      "aliases": [],
      "symptoms": [],
      "growth_stages": []
    }
  ],
  "pesticide_plans": [
    {
      "target": "",
      "pesticide_name": "",
      "formulation": "",
      "active_ingredient": "",
      "dosage_value": "",
      "dosage_unit": "",
      "application_method": "",
      "water_volume": "",
      "phi_days": null,
      "phi_note": "",
      "application_timing": "",
      "max_applications_per_season": null,
      "precautions": [],
      "evidence_text": ""
    }
  ],
  "source_provenance": {
    "doc_id": "",
    "chunk_id": "",
    "title": "",
    "source_type": "",
    "date": "",
    "url": ""
  }
}
```

## Extraction constraints

- Keep the original pesticide formulation when it is explicitly stated.
- Normalize the target object only when the target can be mapped to the controlled vocabulary.
- Use `null` for numeric fields that are not supported by the text.
- Keep dosage ranges as ranges instead of converting them into a single value during extraction.
- Preserve the evidence text span that supports target, pesticide, dosage, PHI, or timing fields.
- Do not create a treatment relation when the text only mentions a pesticide without a supported target.
- Do not create a PHI node when the PHI is absent or only implied.

