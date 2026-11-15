# Architecture

Tang is foundations, not a dispatcher.

```
┌─────────────────────────────────────────────────────────┐
│  tang CLI (init / adopt / verify / status)              │
│  packs/*          plugin/skills/*        templates/*    │
└───────────────────────────┬─────────────────────────────┘
                            │ writes
                            ▼
┌─────────────────────────────────────────────────────────┐
│  Product repo                                           │
│  make verify · .tang/manifest.yml · .cursor/skills ·    │
│  .cursor/rules/tang.mdc · docs/FEATURE_MAP.md           │
└───────────────────────────┬─────────────────────────────┘
                            │ allowlist + verify contract
                            ▼
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│   slashbay   │───▶│ warm workers │───▶│  helmrail    │
│   (intake)   │    │  dkai-agent  │    │  (command)   │
└──────────────┘    └──────────────┘    └──────────────┘
                            │
                            ▼
                     fleetshade (observe)
```

## Principles

1. **Codebase is the constraint** — agents copy what they see; bad APIs become lint bans.
2. **One verify gate** — `make verify` is the contract warm workers and humans share.
3. **Skills route work** — `tang-mode` playbooks force investigate → change → verify → open MR.
4. **Bootstrap is a first-class path** — `tang init` / `tang adopt` hook repos into the fleet docs and allowlist checklist.
