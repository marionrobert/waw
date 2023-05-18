.PHONY: help run test console routes migrate
default: help

help: ## Display help.
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

bundle: ## Check or install gems
	bundle check || bundle install

docker:
	docker build . -t waw

routes: bundle ## Show application routes
	bundle exec rake routes

run: bundle config/database.yml ## Start application
	bundle exec puma -C config/puma.rb -b tcp://0.0.0.0:3000 --pidfile /tmp/puma.pid

migrate: bundle config/database.yml ## Run DB migrations
	bundle exec rake db:migrate

test: bundle config/database.yml ## Run test
	DISABLE_SPRING=0 bundle exec rspec $(params)
