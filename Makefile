all: proxy

proxy:
	@echo "Starting Proxy Deployment"
	@./scripts/deploy-haproxy.sh

proxy_docker:
	@echo "Starting Proxy Deployment"
	@./scripts/system.sh
	@./scripts/deploy-haproxy.sh

proxy_test:
	@echo "Perform Compliance Test for HAProxy"
	@inspec exec tests/haproxy

.DEFAULT_GOAL := all

.PHONY: all proxy proxy_test
