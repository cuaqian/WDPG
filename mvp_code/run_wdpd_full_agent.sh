#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
IMAGE_PATH="${1:-}"
USER_TEXT="${2:-}"
PROMPT_JSON="${3:-$REPO_ROOT/prompts/best_prompt.json}"
PRESCRIPTION_PATH="${4:-}"
LIBRARY_PATH="${5:-${PRESCRIPTION_LIBRARY_PATH:-$REPO_ROOT/prescription_library/deep_all.json}}"

if [[ -z "${IMAGE_PATH}" ]]; then
  echo "usage: bash run_wdpd_full_agent.sh <image_path> [user_text] [prompt_json] [prescription_path] [library_path]" >&2
  exit 1
fi

cd "$REPO_ROOT"
source .venv/bin/activate
if [[ -f server_env.sh ]]; then
  source server_env.sh
fi

export ENABLE_WRITEBACK=0
export PRESCRIPTION_LIBRARY_MODE=1
export PRESCRIPTION_LIBRARY_PATH="$LIBRARY_PATH"

PYTHONPATH="$REPO_ROOT" python3 - <<'PY' "$IMAGE_PATH" "$USER_TEXT" "$PROMPT_JSON" "$PRESCRIPTION_PATH"
import json
import sys

from wise_clinic.wdpd_agent import run_once

image_path = sys.argv[1]
user_text = sys.argv[2]
prompt_json = sys.argv[3]
prescription_path = sys.argv[4]

out = run_once(
    image_path=image_path,
    user_text=user_text,
    prompt_json_path=prompt_json,
    prescription_path=prescription_path,
    library_path="",
    experiment_mode="wdpd_full_agent_library",
)
print(json.dumps(out, ensure_ascii=False, indent=2))
PY

