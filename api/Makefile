export VERSION=$(git rev-parse HEAD)
export APP_NAME="practicum.rails.api"

# HELP
.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# DOCKER TASKS

build: ## build the api 
	docker-compose build --no-cache $(APP_NAME)
	docker build -t $(APP_NAME) .

prepare:
	docker-compose run $(APP_NAME) rake db:prepare

run: ## runs the api
	docker run $(APP_NAME)

dev: ## runs in develop mode
	docker-compose build --no-cache $(APP_NAME) && docker-compose run $(APP_NAME)

up: ## ups the container
	docker-compose up --build $(APP_NAME)

stop: ## stop the api
	docker stop $(APP_NAME)

# Docker tagging
tag: tag-latest tag-version ## Generate container tags for the `{version}` ans `latest` tags

tag-latest: ## Generate container `{version}` tag
	@echo 'create tag latest'
	docker tag $(APP_NAME) cf-eng/$(APP_NAME):latest

tag-version: ## Generate container `latest` tag
	@echo 'create tag $(VERSION)'
	docker tag $(APP_NAME) cf-eng/$(APP_NAME):$(VERSION)
