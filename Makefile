.PHONY: install-uv
install-uv:  ## Install uv if it's not present.
	@command -v uv >/dev/null 2>&1 || curl -LsSf https://astral.sh/uv/install.sh | sh

.PHONY: frozen-sync
frozen-sync:
	uv sync --frozen

.PHONY: init
init: install-uv frozen-sync

.PHONY: install-dev
install-dev:
	uv sync --dev

.PHONY: lint-code
lint-code: install-dev
	uv run ruff check --fix --exit-zero .

.PHONY: format-code
format-code: install-dev
	uv run ruff format .

.PHONY: fix-code
fix-code: lint-code format-code

.PHONY: type-check
type-check: install-dev
	uv run mypy
