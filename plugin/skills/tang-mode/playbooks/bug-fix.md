# Playbook: bug-fix

1. Reproduce or gather failing evidence (test, log, screenshot).
2. Root-cause with code citations; avoid speculative rewrites.
3. Implement the minimal fix.
4. Add or extend a test/lint that would have caught it (`tang-harden` if systemic).
5. Run `make verify`; paste or summarize the gate output.
6. If shipping: follow [opening-pr](opening-pr.md).
