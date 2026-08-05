# DSPy prompt optimization protocol

## Task

The diagnostic task is a six-class closed-set wheat pest and disease recognition task. The input is a wheat field image and optional symptom text. The output is a structured diagnosis record.

## Output schema

- `label`: one of the six task labels.
- `confidence`: numeric confidence score.
- `reason`: short diagnostic rationale.
- `visual_features`: image evidence used for the diagnosis.

## Data use

- Training split: used to summarize frequent errors and design candidate prompt directions.
- Validation split: used to select the candidate prompt.
- Test split: used only for final evaluation.

## Candidate design

Candidate prompts were generated around four practical constraints:

- closed-set label boundary
- organ-first visual inspection
- confusion handling for visually similar classes
- structured output format

The review-facing MVP includes the final prompt, the candidate ranking summary, and BASE/BEST metrics. Full candidate prompt records are withheld from the MVP package and will be released with the maintained repository after acceptance/publication.

## Selection criterion

Candidate prompts were ranked by validation-set diagnosis accuracy under the six-class closed-set task. Macro Precision, Recall, and F1 were also tracked.

## Deployment

The selected prompt is loaded directly by the Diagnostic agent. The final test results in the manuscript use the held-out test set and the saved prompt file.
