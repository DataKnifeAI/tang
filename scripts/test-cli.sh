#!/usr/bin/env bash
# Smoke tests for bin/tang
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TANG="${ROOT}/bin/tang"
TMP="$(mktemp -d /tmp/tang-test-XXXXXX)"
trap 'rm -rf "${TMP}"' EXIT

chmod +x "${TANG}"

"${TANG}" help >/dev/null
"${TANG}" _check-skills >/dev/null
skills_list="$("${TANG}" _list-skills)"
grep -qx tang-mode <<<"${skills_list}"

# init
"${TANG}" init smoke-app --lang shell --dir "${TMP}"
test -f "${TMP}/smoke-app/.tang/manifest.yml"
test -f "${TMP}/smoke-app/.cursor/rules/tang.mdc"
test -d "${TMP}/smoke-app/.cursor/skills/tang-mode"
test -f "${TMP}/smoke-app/Makefile"
grep -q 'Makefile.verify' "${TMP}/smoke-app/Makefile"

# adopt on a fresh dir with package.json → node
mkdir -p "${TMP}/nodey"
echo '{}' >"${TMP}/nodey/package.json"
git -C "${TMP}/nodey" init -q
"${TANG}" adopt "${TMP}/nodey" >/dev/null
grep -q 'node' "${TMP}/nodey/.tang/manifest.yml"

# status
status_out="$("${TANG}" status "${TMP}/smoke-app")"
grep -q 'manifest:' <<<"${status_out}"

echo "test-cli: ok"
