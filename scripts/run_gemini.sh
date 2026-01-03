#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/run_gemini.sh <plan_path> [design_path]

Examples:
  scripts/run_gemini.sh docs/plans/20260103-2145-sample-landing-page-refresh.md
  scripts/run_gemini.sh docs/plans/20260103-2145-sample-landing-page-refresh.md \
    docs/designs/20260103-2145-sample-landing-page-refresh.md
EOF
}

if [[ ${#} -lt 1 ]]; then
  usage
  exit 1
fi

plan_path="$1"
design_path="${2:-}"

if [[ ! -f "$plan_path" ]]; then
  echo "Missing plan: $plan_path" >&2
  exit 1
fi

prompt="You are gemini-cli, the designer. Provide design guidance.\n"
prompt+="Produce a design handoff that claude-code can implement.\n"
prompt+="\n--- PLAN ---\n"
prompt+="$(cat "$plan_path")\n"

if [[ -n "$design_path" ]]; then
  if [[ ! -f "$design_path" ]]; then
    echo "Missing design: $design_path" >&2
    exit 1
  fi
  prompt+="\n--- DESIGN TEMPLATE ---\n"
  prompt+="$(cat "$design_path")\n"
fi

gemini "$prompt"

