# Playbook: harden

1. State the recurring agent mistake in one line.
2. Choose the deterministic check (lint rule, type, forbidden API, test).
3. Apply via `tang-harden` skill against the active pack under `.tang/pack/` or project config.
4. Prove the check fails on the bad pattern and passes on good code.
5. Run `make verify`.
