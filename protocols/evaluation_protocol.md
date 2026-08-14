# Evaluation Protocol

## Diagnosis Evaluation

Diagnosis is evaluated on the six-class held-out test set. Metrics include Accuracy, macro Precision, macro Recall, and macro F1.

The six labels are:

- healthy wheat
- wheat stripe rust
- wheat powdery mildew
- wheat aphid
- wheat Fusarium head blight
- other

## Full-Process Evaluation

The held-out test set is used for end-to-end evaluation. Healthy and other samples are treated as non-actionable cases. For those samples, returning an empty prescription is counted as the correct safe output. The same rule is applied to all evaluated models.

## Prescription Evaluation

Prescription outputs are evaluated against the reviewed prescription boundary. The field-level checks include:

- whether the recommended pesticide is compatible with the diagnosed target;
- whether the dosage is executable and consistent with the reviewed prescription boundary;
- whether PHI information is complete and consistent;
- whether the full prescription satisfies pesticide, dosage, PHI, target, and safety-boundary requirements at the same time.

Outputs outside the reviewed prescription boundary require expert adjudication before being counted as correct.

## Scope

This protocol documents the evaluation rules used in the manuscript.
