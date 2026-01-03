#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/run_claude.sh <plan_path> [design_path] [handoff_path]

Examples:
  scripts/run_claude.sh docs/plans/20260103-2145-sample-landing-page-refresh.md
  scripts/run_claude.sh docs/plans/20260103-2145-sample-landing-page-refresh.md \
    docs/designs/20260103-2145-sample-landing-page-refresh.md \
    docs/handoffs/20260103-2145-sample-landing-page-refresh.md
EOF
}

if [[ ${#} -lt 1 ]]; then
  usage
  exit 1
fi

plan_path="$1"
design_path="${2:-}"
handoff_path="${3:-}"

if [[ ! -f "$plan_path" ]]; then
  echo "Missing plan: $plan_path" >&2
  exit 1
fi

prompt="You are claude-code, the developer. Implement the plan.\n"
prompt+="Follow all acceptance criteria and test plan.\n"
prompt+="Do not change scope without explicit approval.\n"
prompt+="\n--- PLAN ---\n"
prompt+="$(cat "$plan_path")\n"

if [[ -n "$design_path" ]]; then
  if [[ ! -f "$design_path" ]]; then
    echo "Missing design: $design_path" >&2
    exit 1
  fi
  prompt+="\n--- DESIGN ---\n"
  prompt+="$(cat "$design_path")\n"
fi

if [[ -n "$handoff_path" ]]; then
  if [[ ! -f "$handoff_path" ]]; then
    echo "Missing handoff: $handoff_path" >&2
    exit 1
  fi
  prompt+="\n--- DEV HANDOFF TEMPLATE ---\n"
  prompt+="$(cat "$handoff_path")\n"
fi

claude "$prompt"
