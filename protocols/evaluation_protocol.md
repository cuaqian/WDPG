# Evaluation protocol

## Diagnosis evaluation

Diagnosis is evaluated on the six-class test set. Metrics include Accuracy, macro Precision, macro Recall, and macro F1.

The six labels are:

- healthy wheat
- wheat stripe rust
- wheat powdery mildew
- wheat aphid
- wheat Fusarium head blight
- other

## Full-process evaluation

The 601-sample held-out test set is used for end-to-end evaluation. Healthy and other samples are non-actionable cases. For those samples, an empty prescription is counted as the correct safe output. The same rule is applied to all compared models.

## Actionable prescription evaluation

The actionable prescription subset contains only the four treatable pest and disease categories. It is used to evaluate pesticide, dosage, PHI, and full prescription correctness without the healthy and other cases.

## Prescription adjudication

Model outputs are first checked against the reviewed prescription boundary. Outputs outside the boundary can be submitted to expert adjudication. Expert review checks pesticide-target compatibility, dosage, PHI, application timing, growth-stage suitability, and source support.

The final manuscript should report one clearly named prescription metric. Recommended name:

```text
expert-adjudicated full prescription accuracy
```

If automatic strict-boundary metrics are also shown, they should be labeled as strict boundary metrics and placed in a supplementary table.

## Statistical analysis

Saved prediction files can be used to compute:

- bootstrap 95% confidence intervals
- McNemar's test between paired model predictions
- absolute improvement
- relative error reduction

The MVP script `mvp_code/recompute_diagnosis_statistics.py` covers diagnosis-level statistics from saved predictions.

