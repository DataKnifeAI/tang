# Tang — agentic foundations for DataKnifeAI
.DEFAULT_GOAL := help

SHELL := /bin/bash
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BIN := $(ROOT)/bin/tang

.PHONY: help verify test lint skills-list install-local clean

help: ## Show targets
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-16s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

verify: ## Full gate (agents must pass this)
	@$(MAKE) lint
	@$(MAKE) test
	@echo "ok: tang verify"

lint: ## shellcheck CLI + validate skill layout
	@export PATH="$(HOME)/.local/bin:$$PATH"; \
	  command -v shellcheck >/dev/null 2>&1 || { echo "shellcheck required (e.g. install to ~/.local/bin)"; exit 1; }; \
	  shellcheck -x $(BIN) $(ROOT)/scripts/test-cli.sh
	@$(BIN) _check-skills
	@echo "ok: lint"

test: ## CLI smoke tests
	@$(ROOT)/scripts/test-cli.sh
	@echo "ok: test"

skills-list: ## List factory skills
	@$(BIN) _list-skills

install-local: ## Symlink tang onto PATH (~/.local/bin)
	@mkdir -p "$(HOME)/.local/bin"
	@ln -sfn "$(BIN)" "$(HOME)/.local/bin/tang"
	@echo "installed: $(HOME)/.local/bin/tang"

clean: ## Remove temp artifacts
	@rm -rf "$(ROOT)/.tang-tmp" /tmp/tang-test-*
