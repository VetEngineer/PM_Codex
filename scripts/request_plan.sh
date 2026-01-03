#!/usr/bin/env bash
set -euo pipefail

if [[ ${#} -lt 1 ]]; then
  echo "Usage: scripts/request_plan.sh <title>" >&2
  exit 1
fi

title="$*"
out="$(scripts/new_doc.sh plan "$title" | tail -n1)"
path="${out#Created: }"

echo "Plan created: $path"
echo "Next: Codex fills the plan and shares it with the team."

