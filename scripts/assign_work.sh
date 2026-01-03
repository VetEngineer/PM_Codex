#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/assign_work.sh <project_name> <title>

Example:
  scripts/assign_work.sh "Landing Refresh" "User auth flow"
EOF
}

if [[ ${#} -lt 2 ]]; then
  usage
  exit 1
fi

project_name="$1"
shift
title="$*"

scripts/start_project.sh "$project_name"
scripts/new_doc.sh --project "$project_name" plan "$title" >/dev/null
scripts/new_doc.sh --project "$project_name" design "$title" >/dev/null
scripts/new_doc.sh --project "$project_name" dev "$title" >/dev/null
scripts/new_doc.sh --project "$project_name" review "$title" >/dev/null

echo "Assigned work under project: $project_name"
