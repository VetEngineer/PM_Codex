#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/new_doc.sh [--project "Project Name"] <type> <title>

Types:
  plan    -> docs/plans
  design  -> docs/designs
  dev     -> docs/handoffs
  review  -> docs/reviews
  decision-> docs/decisions

Example:
  scripts/new_doc.sh --project "Landing Refresh" plan "User auth flow"
  scripts/new_doc.sh plan "User auth flow"
EOF
}

project_name=""
if [[ ${1:-} == "--project" ]]; then
  if [[ ${#} -lt 3 ]]; then
    usage
    exit 1
  fi
  project_name="$2"
  shift 2
fi

if [[ ${#} -lt 2 ]]; then
  usage
  exit 1
fi

type="$1"
shift
title="$*"

case "$type" in
  plan) subdir="docs/plans"; template="templates/plan.md" ;;
  design) subdir="docs/designs"; template="templates/design.md" ;;
  dev) subdir="docs/handoffs"; template="templates/dev.md" ;;
  review) subdir="docs/reviews"; template="templates/review.md" ;;
  decision) subdir="docs/decisions"; template="templates/decision.md" ;;
  *) echo "Unknown type: $type" >&2; usage; exit 1 ;;
esac

if [[ ! -f "$template" ]]; then
  echo "Missing template: $template" >&2
  exit 1
fi

timestamp="$(date +%Y%m%d-%H%M)"
slug="$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//')"
date_slug="$(date +%Y%m%d)"
project_root="."
if [[ -n "$project_name" ]]; then
  project_slug="$(echo "$project_name" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//')"
  project_root="Projects/${date_slug}_${project_slug}"
fi

dir="${project_root}/${subdir}"
mkdir -p "$dir"
outfile="$dir/${timestamp}-${slug}.md"

sed -e "s/{{TITLE}}/${title}/g" -e "s/{{DATE}}/${timestamp}/g" "$template" > "$outfile"

echo "Created: $outfile"
