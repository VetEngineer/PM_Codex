#!/usr/bin/env bash
set -euo pipefail

if [[ ${#} -lt 1 ]]; then
  echo "Usage: scripts/request_review.sh <title>" >&2
  exit 1
fi

title="$*"
out="$(scripts/new_doc.sh review "$title" | tail -n1)"
path="${out#Created: }"

echo "Review doc created: $path"
echo "Next: Codex reviews the pushed changes and records accept/reject."

