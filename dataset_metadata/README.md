# Dataset metadata

This folder provides the review-facing dataset split and benchmark-label metadata used to verify the reported test-set metrics without redistributing raw image files.

## Files

- `class_source_split_summary.csv`: class-wise source composition and train/validation/test split counts.
- `benchmark_labels_test.csv`: sample-level labels for the 601-image held-out test set, with anonymized image IDs, relative paths, split names, class labels, and source type.

Raw image files are not included in this package because part of the dataset was collected from publicly accessible online sources and may involve redistribution restrictions. Controlled review copies can be provided upon editorial request under appropriate data-use conditions.
