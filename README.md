# PM_Codex

This repository runs a strict multi-agent workflow:
Codex is the PM, claude-code implements, and gemini-cli provides design input.

## Core Docs

- Team charter and roles: `AGENTS.md`
- Planning template: `docs/PLAN.md`
- Design handoff template: `docs/DESIGN.md`
- Review and acceptance: `docs/REVIEW.md`
- Decision log: `docs/DECISIONS.md`
- Workflow rules: `docs/WORKFLOW.md`
- Request and handoff templates: `docs/TEMPLATES.md`

## Quick Start

1. Codex writes a plan in `docs/PLAN.md`.
2. gemini-cli provides design guidance in `docs/DESIGN.md`.
3. claude-code implements and pushes changes.
4. Codex reviews using `docs/REVIEW.md` and accepts or rejects.

## Scripted Templates

Create timestamped docs from templates:

```sh
scripts/new_doc.sh plan "User auth flow"
scripts/new_doc.sh design "User auth flow"
scripts/new_doc.sh dev "User auth flow"
scripts/new_doc.sh review "User auth flow"
scripts/new_doc.sh decision "Auth flow exception"
```

Create project-scoped docs under `Projects/<date>_<project>/`:

```sh
scripts/new_doc.sh --project "Landing Refresh" plan "User auth flow"
```

## Agent Call Stubs

Use scripts to create handoff docs and indicate the next agent action:

```sh
scripts/request_plan.sh "User auth flow"
scripts/request_design.sh "User auth flow"
scripts/request_dev.sh "User auth flow"
scripts/request_review.sh "User auth flow"
```

Project-scoped examples:

```sh
scripts/request_plan.sh --project "Landing Refresh" "User auth flow"
scripts/request_design.sh --project "Landing Refresh" "User auth flow"
scripts/request_dev.sh --project "Landing Refresh" "User auth flow"
scripts/request_review.sh --project "Landing Refresh" "User auth flow"
```

Create a full project workspace with all docs:

```sh
scripts/assign_work.sh "Landing Refresh" "User auth flow"
```

## CLI Agent Calls

Run gemini-cli to produce design guidance:

```sh
scripts/run_gemini.sh docs/plans/<plan>.md docs/designs/<design>.md
```

Run claude-code to implement:

```sh
scripts/run_claude.sh docs/plans/<plan>.md docs/designs/<design>.md docs/handoffs/<dev>.md
```
