.PHONY: install-uv
install-uv:  ## Install uv if it's not present.
	@command -v uv >/dev/null 2>&1 || curl -LsSf https://astral.sh/uv/install.sh | sh

.PHONY: install
install: install-uv ## Install the package, dependencies
	uv sync --frozen --all-extras --all-packages --group lint

.PHONY: sync
sync: install-uv ## Update local packages and uv.lock
	uv sync --all-extras --all-packages --group lint

.PHONY: check-code
check-code:
	uv run ruff check
	uv run ruff format --check

.PHONY: fix-code
fix-code:
	uv run ruff check --fix --exit-zero
	uv run ruff format

.PHONY: type-check
type-check: ## Check the typing
	uv run mypy
