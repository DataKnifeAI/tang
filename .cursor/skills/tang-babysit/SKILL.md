---
name: tang-babysit
description: >-
  Drive a GitHub PR or GitLab MR to merge-ready: CI failures, review threads,
  conflicts. Uses gh/glab. Re-run make verify after fixes. Do not merge unless
  explicitly requested.
---

# tang-babysit

## Steps

1. Detect host: `gh` for GitHub, `glab` for GitLab (prefer agent-skills CLIs if installed).
2. Fetch PR/MR status, checks, and review threads.
3. Fix failures with minimal diffs; after each batch run `make verify`.
4. Reply to review threads with evidence (verify output, test names).
5. Resolve conflicts carefully; never force-push unless the user asks.
6. Stop at merge-ready unless the user explicitly requests merge.
