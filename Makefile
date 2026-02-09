MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: helm-unittest
helm-unittest:
	docker run --rm -v $(MAKEFILE_DIR):/apps helmunittest/helm-unittest:3.19.0-1.0.3 --strict --file 'tests/**/*.yaml' charts/*

.PHONY: helm-docs
helm-docs:
	docker run --rm -v $(MAKEFILE_DIR):/helm-docs -u $(shell id -u) jnorwood/helm-docs:v1.14.2 --chart-search-root=charts
