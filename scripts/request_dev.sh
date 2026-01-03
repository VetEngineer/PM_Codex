#!/usr/bin/env bash
set -euo pipefail

if [[ ${#} -lt 1 ]]; then
  echo "Usage: scripts/request_dev.sh [--project \"Project Name\"] <title>" >&2
  exit 1
fi

project_args=()
if [[ ${1:-} == "--project" ]]; then
  project_args=("$1" "$2")
  shift 2
fi

title="$*"
out="$(scripts/new_doc.sh "${project_args[@]}" dev "$title" | tail -n1)"
path="${out#Created: }"

echo "Dev handoff created: $path"
echo "Next: send the plan/design docs to claude-code along with this handoff."
