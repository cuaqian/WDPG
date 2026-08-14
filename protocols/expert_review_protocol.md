# Expert review protocol

## Review target

Expert review is used for two materials:

- prescription library entries
- model-generated prescriptions that fall outside the automatic reviewed boundary or are judged incorrect by strict matching

## Reviewer background

The review was conducted by plant protection experts familiar with wheat pest and disease management and pesticide-use constraints.

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

When reviewers disagreed, the entry was rechecked by at least two experts against the original source and disputed fields. If agreement could not be reached, the conservative decision was used. For pesticide recommendations, a conservative decision means the entry is not accepted as a correct prescription unless the target, dosage, PHI, and source support are all clear.

## Reporting

The manuscript reports the number of reviewers, their professional background, the review criteria, and the resolution rule for disagreements. Individual identities are handled through de-identified review records.
