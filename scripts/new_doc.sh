#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/new_doc.sh <type> <title>

Types:
  plan    -> docs/plans
  design  -> docs/designs
  dev     -> docs/handoffs
  review  -> docs/reviews
  decision-> docs/decisions

Example:
  scripts/new_doc.sh plan "User auth flow"
EOF
}

if [[ ${#} -lt 2 ]]; then
  usage
  exit 1
fi

type="$1"
shift
title="$*"

case "$type" in
  plan) dir="docs/plans"; template="templates/plan.md" ;;
  design) dir="docs/designs"; template="templates/design.md" ;;
  dev) dir="docs/handoffs"; template="templates/dev.md" ;;
  review) dir="docs/reviews"; template="templates/review.md" ;;
  decision) dir="docs/decisions"; template="templates/decision.md" ;;
  *) echo "Unknown type: $type" >&2; usage; exit 1 ;;
esac

if [[ ! -f "$template" ]]; then
  echo "Missing template: $template" >&2
  exit 1
fi

timestamp="$(date +%Y%m%d-%H%M)"
slug="$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//')"
mkdir -p "$dir"
outfile="$dir/${timestamp}-${slug}.md"

sed -e "s/{{TITLE}}/${title}/g" -e "s/{{DATE}}/${timestamp}/g" "$template" > "$outfile"

echo "Created: $outfile"

