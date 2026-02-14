# Makefile for AZR biblatex citation style testing
# Requires Docker for running tests (no local TeX installation needed)

DOCKER_IMAGE = azr-biblatex-test
DOCKER_RUN = docker run --rm -v "$(CURDIR)":/workspace $(DOCKER_IMAGE)

# All test names (without .lvt extension)
TESTS = article book inbook incollection inproceedings thesis jurisdiction legislation

.PHONY: help build test save save-all check clean

help: ## Show this help
	@echo "AZR Biblatex Citation Style - Test Suite"
	@echo ""
	@echo "Usage:"
	@echo "  make build        Build the Docker image (run once)"
	@echo "  make test         Run all regression tests"
	@echo "  make check        Alias for 'make test'"
	@echo "  make save-all     Generate/update ALL .tlg baseline files"
	@echo "  make save T=name  Generate/update .tlg for a specific test"
	@echo "  make clean        Remove build artifacts"
	@echo ""
	@echo "Examples:"
	@echo "  make build && make test"
	@echo "  make save T=article"
	@echo "  make save-all"
	@echo ""
	@echo "Test files:"
	@echo "  tests/testfiles/*.lvt  - Test source files"
	@echo "  tests/testfiles/*.tlg  - Expected output (golden files)"
	@echo "  tests/support/         - biblatex.cfg + references.bib"

build: ## Build Docker image with TeX Live
	docker build -t $(DOCKER_IMAGE) .

test: check ## Run all regression tests (alias for check)

check: ## Run l3build check (all tests)
	$(DOCKER_RUN) bash -c "cd /workspace/tests && l3build check"

save: ## Save .tlg for a specific test (usage: make save T=article)
ifndef T
	$(error Usage: make save T=<testname>, e.g. make save T=article)
endif
	$(DOCKER_RUN) bash -c "cd /workspace/tests && l3build save $(T)"

save-all: ## Generate/update all .tlg baseline files
	$(DOCKER_RUN) bash -c "cd /workspace/tests && for t in $(TESTS); do echo '=== Saving: '$$t' ===' && l3build save $$t; done"

clean: ## Remove build artifacts
	$(DOCKER_RUN) bash -c "cd /workspace/tests && l3build clean"
	@echo "Clean complete."
