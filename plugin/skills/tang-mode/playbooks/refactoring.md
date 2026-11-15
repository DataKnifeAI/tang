# Playbook: refactoring

1. Confirm behavior must stay identical; list invariants.
2. Prefer mechanical moves; keep diffs reviewable.
3. Rely on `make verify` + existing tests as the safety net; add tests if coverage is thin.
4. Run `make verify` before claiming done.
5. If shipping: follow [opening-pr](opening-pr.md).
