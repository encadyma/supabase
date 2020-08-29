DOCKER_REVISION ?= hello-world-testing-$(USER)

APP_DOCKER_TAG = docker-push.ocf.berkeley.edu/hello-world:$(DOCKER_REVISION)
APP_VERSION := latest

.PHONY: cook-image
cook-image:
	docker build --build-arg app_version=$(APP_VERSION) --pull -f Dockerfile -t $(APP_DOCKER_TAG) .

.PHONY: push-image
push-image:
	docker push $(APP_DOCKER_TAG)
