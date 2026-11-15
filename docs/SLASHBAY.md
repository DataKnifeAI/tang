# Hook into Slashbay

Tang does not modify Slashbay in v0. It prepares the **repo contract** Slashbay workers should honor.

## Prerequisites

- Repo under [DataKnifeAI](https://github.com/DataKnifeAI) (or mirrored org Slashbay allowlists)
- `make verify` green locally
- Tang skills/rules installed (`tang adopt`)

## Allowlist

Slashbay uses `SLASHBAY_REPO_ALLOWLIST` (`owner/name` or `owner/*`). After publish:

```text
DataKnifeAI/<repo>
```

Example for this project once public:

```text
DataKnifeAI/tang
```

Set on the Slashbay deployment secret/config (see [slashbay README](https://github.com/DataKnifeAI/slashbay)). Leave `SLASHBAY_DRY_RUN=true` until ready.

## Worker contract

Warm `dkai-agent` workspaces claim jobs and run `agent -p`. Tang’s expectation:

1. Clone the allowlisted repo
2. Implement the issue
3. Run **`make verify`** before `complete` with `ok`
4. Open MR/PR; report URL via Slashbay progress

Document in the job prompt or Coder template that verify is required. Tang skills (`tang-mode`) already encode that loop for interactive agents.

## Webhooks

Org/repo Issue webhooks → Slashbay (`POST /webhooks/github` or `/webhooks/gitlab`) are configured on Slashbay’s side. Tang only ensures the target repo is ready to be allowlisted.
