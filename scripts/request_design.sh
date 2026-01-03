#!/usr/bin/env bash
set -euo pipefail

if [[ ${#} -lt 1 ]]; then
  echo "Usage: scripts/request_design.sh <title>" >&2
  exit 1
fi

title="$*"
out="$(scripts/new_doc.sh design "$title" | tail -n1)"
path="${out#Created: }"

echo "Design brief created: $path"
echo "Next: send this brief to gemini-cli for design guidance."

