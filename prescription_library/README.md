# Prescription library

This folder contains the prescription-library summary used for the WDPG-AGENT manuscript revision.

## Files

- `summary.json`: count summary, interpretation, and four representative reviewed examples, one for each actionable category.

## Use boundary

The reviewed prescription library is a recommendation boundary for the four actionable categories in the experiment:

- wheat stripe rust
- wheat powdery mildew
- wheat aphid
- wheat Fusarium head blight

The 35 reviewed entries are recommendation entries. They do not enumerate every pesticide registered for wheat. The library focuses on common, official, executable, and source-traceable treatment options.

## Fields expected in each usable entry

- control target
- recommended pesticide or formulation
- active ingredient if available
- dosage and application method
- PHI
- precautions
- source provenance

## Expert review

Plant protection experts review the prescription entries before evaluation. Review focuses on target-pesticide compatibility, dosage executability, PHI completeness, growth-stage suitability, and source support.

The online Prescription agent reads the reviewed library after diagnosis and outputs one preferred plan by default.

This folder also provides a de-identified expert review protocol and summary:

- `expert_review_protocol.md`
- `expert_review_summary.json`

If the editor requires item-level inspection during review, a controlled machine-readable review copy can be provided separately under appropriate review conditions.
