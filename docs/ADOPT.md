# Adopt an existing DataKnifeAI repo

Use this for repos that already exist (pulseblade, dockfire, high-command-*, operators, MCP servers, gitops-*).

## Steps

```bash
# From a Tang checkout
./bin/tang adopt /path/to/repo
# or, with PATH install:
tang adopt /path/to/repo
```

`tang adopt`:

1. Detects language hints (`Cargo.toml`, `go.mod`, `pyproject.toml` / `requirements.txt`, `package.json`, else `shell`)
2. Writes `.tang/manifest.yml`
3. Ensures a `verify` target (merges pack Makefile fragment guidance)
4. Installs Tang skills into `.cursor/skills/`
5. Installs `.cursor/rules/tang.mdc`
6. Seeds `docs/FEATURE_MAP.md` if missing
7. Prints the Slashbay allowlist line to add

Then:

1. Run `make verify` in that repo and fix gaps until green
2. Follow [SLASHBAY.md](./SLASHBAY.md) to allowlist the repo
3. Prefer shared CLI skills from [agent-skills](https://github.com/DataKnifeAI/agent-skills) via their installer when agents need `gh` / `glab` / `kubectl`

## Suggested first wave

| Repo | Likely pack |
|------|-------------|
| pulseblade | rust |
| helmrail | rust |
| slashbay | python |
| high-command-api / high-command-mcp | python |
| high-command-ui | node |
| *-operator, *-mcp (Go) | go |
| coldberth, gitops-* | shell |
| dockfire, fleetshade, agent-hub | node or shell |

Adopt one repo, prove `make verify` + an agent PR, then roll out.
