---
name: tang-harden
description: >-
  Turn a recurring agent mistake into a deterministic lint, type, or test check
  in the active Tang language pack. Use when the same correction would otherwise
  become a comment or markdown rule.
---

# tang-harden

## Steps

1. Write the anti-pattern in one sentence (what agents keep doing wrong).
2. Locate the active pack: `.tang/pack/` or `packs/<lang>/` in Tang itself.
3. Encode the fix as the strongest available check:
   - python → ruff rule / pytest
   - rust → clippy lint or API that cannot express the bug
   - go → golangci-lint linter or test
   - node → biome/eslint rule or test
   - shell → shellcheck directive or script test
4. Show a minimal failing case and a passing case.
5. Run `make verify`.
6. Do **not** add long prose warnings; the check is the documentation.
