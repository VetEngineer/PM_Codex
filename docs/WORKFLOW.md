# Branch and PR Rules

This workflow keeps Codex as the final approver.

## Branching

- Use feature branches: `feat/<short-topic>` or `fix/<short-topic>`
- Keep branches small and focused on a single plan
- Avoid long-lived branches

## Implementation Flow

1. Codex publishes a plan in `docs/PLAN.md`.
2. gemini-cli provides design input in `docs/DESIGN.md` when needed.
3. claude-code implements on a feature branch, commits, and pushes.
4. Codex reviews and either accepts or rejects in `docs/REVIEW.md`.

## CLI Usage

- Generate docs with `scripts/new_doc.sh`
- Invoke gemini-cli with `scripts/run_gemini.sh`
- Invoke claude-code with `scripts/run_claude.sh`

## Project Folders

- Create a project root with `scripts/start_project.sh "Project Name"`
- Or pass `--project "Project Name"` to create docs under `Projects/<date>_<project>/`

## Acceptance and Merge

- Codex is the only agent that merges to the main branch.
- If accepted, Codex merges and writes the final merge commit message.
- If rejected, Codex logs blockers and publishes a revised plan.

## PR Expectations

- One plan per PR
- Include references to the plan and design docs
- Tests are required or explicitly waived with rationale
