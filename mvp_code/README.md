# MVP code boundary

This folder contains the review-facing MVP code.

## Files

- `run_wdpd_full_agent.sh`: single-image entry for the WDPG-AGENT MVP. It requires the original Python package and local model services.
- `recompute_diagnosis_statistics.py`: standalone metric script. It only needs saved prediction files and Python 3.

## Single-image run

The single-image script should be run from the project root where `wise_clinic` is available:

```bash
bash mvp_code/run_wdpd_full_agent.sh /path/to/wheat_image.png
```

Required environment:

- Python virtual environment
- OpenAI-compatible VLM endpoint
- `prompts/best_prompt.json`
- `prescription_library/deep_all.json`
- `CLINIC_MAX_PLANS=1` for one preferred prescription plan

## Saved-result recomputation

The diagnosis statistics script can be run inside this package:

```bash
python mvp_code/recompute_diagnosis_statistics.py \
  --predictions results/predictions/wdpd_agent_test6_full.predictions.jsonl \
  --bootstrap 1000
```

This script provides an auditable check of diagnosis-level metrics and bootstrap confidence intervals. Add `--compare other_predictions.jsonl` only when the two files use the same sample IDs. Prescription metrics require the prescription adjudication script and reviewed prescription boundary; those files should be included if the manuscript reports expert-adjudicated prescription accuracy.
