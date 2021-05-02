all: proxy
ci: proxy_docker proxy_test

proxy:
	@echo "Starting Proxy Deployment"
	@./scripts/deploy-haproxy.sh

proxy_docker:
	@echo "Starting Proxy Deployment"
	@./scripts/system.sh

proxy_test:
	@echo "Perform Compliance Test for HAProxy"
	@inspec exec tests/haproxy --chef-license accept-silent

.DEFAULT_GOAL := all

.PHONY: all proxy proxy_test
