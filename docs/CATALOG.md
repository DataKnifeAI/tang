# Catalog touchpoints

After Tang is published to GitHub under DataKnifeAI:

## agent-hub

Open a PR on [DataKnifeAI/agent-hub](https://github.com/DataKnifeAI/agent-hub) adding a catalog entry in `catalog.js` under **Agents**:

- name: `tang`
- description: structural spine — verify packs, factory skills, bootstrap into slashbay
- install: clone + `./bin/tang adopt` / skills from `plugin/skills`
- homepage: repo URL

## dataknife.ai

Add or regenerate via [dataknife.ai](https://github.com/DataKnifeAI/dataknife.ai) `scripts/sync_catalog.py` so `projects.json` lists Tang under **Agents** with status Active.

## agent-skills (optional later)

If a Tang skill becomes generally useful beyond the factory (e.g. a generic babysit), promote it into [agent-skills](https://github.com/DataKnifeAI/agent-skills) and keep a thin wrapper here.
