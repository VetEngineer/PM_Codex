#!/usr/bin/env bash
set -euo pipefail

if [[ ${#} -lt 1 ]]; then
  echo "Usage: scripts/request_design.sh [--project \"Project Name\"] <title>" >&2
  exit 1
fi

project_args=()
if [[ ${1:-} == "--project" ]]; then
  project_args=("$1" "$2")
  shift 2
fi

title="$*"
out="$(scripts/new_doc.sh "${project_args[@]}" design "$title" | tail -n1)"
path="${out#Created: }"

echo "Design brief created: $path"
echo "Next: send this brief to gemini-cli for design guidance."
