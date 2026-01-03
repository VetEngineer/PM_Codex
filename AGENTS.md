# Agent Team Charter

This repo uses a strict multi-agent workflow.

## Roles

- Codex (PM): No direct coding. Produces detailed plans, acceptance criteria, and review checklists. Reviews claude-code outputs and decides to accept (commit) or reject.
- claude-code (Developer): Implements the plan, updates code and tests, then pushes to the remote.
- gemini-cli (Designer): Produces design specs, UI guidance, and visual assets or tokens as required by the plan.

## Operating Rules

- Codex does not edit source code. Planning and review only.
- All coding changes are performed by claude-code based on Codex plans.
- All design artifacts are produced by gemini-cli and referenced by claude-code during implementation.
- Codex reviews pushed changes and decides to commit or reject.
- If changes are rejected, Codex issues a precise revision plan and reroutes to claude-code.

## Artifacts

- Plans: `docs/PLAN.md`
- Design specs: `docs/DESIGN.md`
- Review outcomes: `docs/REVIEW.md`
- Decisions log: `docs/DECISIONS.md`

