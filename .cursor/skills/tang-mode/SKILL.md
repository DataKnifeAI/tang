---
name: tang-mode
description: >-
  DataKnifeAI verify-first engineering mode. Use at the start of substantive
  work: investigate, change, run make verify, then open MR/PR. Routes to
  tang-harden, tang-feature-map, tang-babysit, and tang-new-project playbooks.
---

# tang-mode

Main shortcut for rigorous agent work in Tang-adopted repos.

## When invoked

1. Match the user request to a playbook under `playbooks/`.
2. Open a todo list whose first items are that playbook’s steps (copy them).
3. Spend **most tokens on verification** after edits — run `make verify` or `tang verify`, cite output.
4. Prefer encoding recurring mistakes via `tang-harden` over adding comments/markdown.
5. End with MR/PR when the user wants landing (see opening-pr playbook / `tang-babysit`).

## Playbooks

| Playbook | For |
|----------|-----|
| [investigation](playbooks/investigation.md) | Read-only: how/why questions |
| [bug-fix](playbooks/bug-fix.md) | Reproduce, fix, verify with evidence |
| [feature](playbooks/feature.md) | New behavior from a named shape |
| [refactoring](playbooks/refactoring.md) | Behavior-preserving structure change |
| [harden](playbooks/harden.md) | Turn a correction into a lint/CI check |
| [babysit](playbooks/babysit.md) | Drive MR/PR to green |
| [new-project](playbooks/new-project.md) | Scaffold and fleet-hook a repo |
| [opening-pr](playbooks/opening-pr.md) | Open a ready PR/MR with conventional commits |

## Rules of thumb

- Codebase > prompts: ban bad APIs in the pack, don’t narrate them.
- No drive-by docs or refactors.
- Before “done”: `make verify` must pass.
