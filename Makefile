DOCKER_REVISION ?= supabase-testing-$(USER)

APP_DOCKER_TAG = docker-push.ocf.berkeley.edu/supabase-aio:$(DOCKER_REVISION)
DB_DOCKER_TAG  = docker-push.ocf.berkeley.edu/supabase-postgres:$(DOCKER_REVISION)

APP_VERSION := latest
DB_VERSION  := latest

.PHONY: cook-image
cook-image:
	docker build --build-arg app_version=$(APP_VERSION) --pull -f Dockerfile.app -t $(APP_DOCKER_TAG) .
	docker build --build-arg db_version=$(DB_VERSION) --pull -f Dockerfile.db -t $(DB_DOCKER_TAG) .

.PHONY: push-image
push-image:
	docker push $(APP_DOCKER_TAG)
	docker push $(DB_DOCKER_TAG)
