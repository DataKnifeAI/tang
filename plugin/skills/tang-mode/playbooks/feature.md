# Playbook: feature

1. Name the data shape / API surface before coding.
2. Check `docs/FEATURE_MAP.md` for reuse; update it when the feature is durable.
3. Implement with the repo’s existing patterns; ban agent-hostile APIs via design.
4. Tests first or alongside — agents must not mark homework without a gate.
5. Run `make verify`.
6. If shipping: follow [opening-pr](opening-pr.md).
