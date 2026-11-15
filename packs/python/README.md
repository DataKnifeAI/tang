# Pack: python

Verify gate: `ruff format --check` → `ruff check` → `pytest`.

Copy `ruff.toml` and merge `Makefile.verify` targets into the project Makefile (or `include packs/python/Makefile.verify` after vendoring).

**Harden rule:** every agent correction that repeats becomes a ruff rule or a failing test — not a README note.
