#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/start_project.sh <project_name>

Example:
  scripts/start_project.sh "Landing Refresh"
EOF
}

if [[ ${#} -lt 1 ]]; then
  usage
  exit 1
fi

project_name="$*"
date_slug="$(date +%Y%m%d)"
project_slug="$(echo "$project_name" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//')"
project_root="Projects/${date_slug}_${project_slug}"

mkdir -p \
  "${project_root}/docs/plans" \
  "${project_root}/docs/designs" \
  "${project_root}/docs/handoffs" \
  "${project_root}/docs/reviews" \
  "${project_root}/docs/decisions"

echo "Created project: ${project_root}"
