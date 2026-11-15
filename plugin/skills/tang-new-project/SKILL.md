---
name: tang-new-project
description: >-
  Scaffold a new DataKnifeAI-ready project with tang init, wire verify packs and
  skills, and explain Slashbay allowlist plus agent-hub/dataknife.ai catalog
  listing steps.
---

# tang-new-project

## Steps

1. Confirm project **name** and **language** (`python|rust|go|node|shell`). Default parent dir: `~/Projects`.
2. From a Tang checkout run:

```bash
./bin/tang init <name> --lang <lang>
```

3. `cd` into the project; run `make verify` and flesh out real tests as needed.
4. Slashbay: add `DataKnifeAI/<name>` to `SLASHBAY_REPO_ALLOWLIST` after the GitHub repo exists (see Tang `docs/SLASHBAY.md`).
5. Catalog: follow Tang `docs/CATALOG.md` for agent-hub + dataknife.ai entries.
6. Prefer shared [agent-skills](https://github.com/DataKnifeAI/agent-skills) for CLI skills; keep factory skills from Tang.
