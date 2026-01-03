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

