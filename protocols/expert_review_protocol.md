# Expert review protocol

## Review target

Expert review is used for two materials:

- prescription library entries
- model-generated prescriptions that fall outside the automatic reviewed boundary or are judged incorrect by strict matching

## Reviewer background

Reviewers should be plant protection experts, agronomists, or extension specialists familiar with wheat pest and disease management and pesticide use constraints.

## Review fields

Each prescription is checked on the following fields:

- control target
- pesticide or formulation
- active ingredient
- dosage
- application method
- PHI
- growth-stage or timing suitability
- safety precautions
- source provenance

## Decision labels

- `pass`: the prescription is suitable within the task boundary.
- `revise`: the prescription contains a correct main drug but has incomplete or imprecise fields.
- `fail`: the prescription is unsuitable, unsupported, unsafe, or outside the target scenario.

## Disagreement handling

When reviewers disagree, the entry should be discussed by at least two experts. If agreement cannot be reached, the conservative decision is used. For pesticide recommendations, a conservative decision means the entry is not accepted as a correct prescription unless the target, dosage, PHI, and source support are all clear.

## Reporting

The manuscript should report the number of reviewers, their professional background, the review criteria, and the resolution rule for disagreements. Individual names can be withheld if required by institutional policy.

