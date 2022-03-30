DATE := $(shell date +"%Y-%m-%d")
REPOSITORY=example.com
IMAGE_NAME=neurove/mopidy
PLATFORM=linux/arm64,linux/arm/v7

all:
	make build && make push

build:
	make build-alpine && make tag

build-alpine:
	docker buildx build --platform $(PLATFORM) --pull --tag $(IMAGE_NAME):$(DATE) .

tag:
	docker tag $(IMAGE_NAME):$(DATE) $(IMAGE_NAME):latest
	docker tag $(IMAGE_NAME):$(DATE) $(REPOSITORY):5000/$(IMAGE_NAME):latest

push:
	docker push $(REPOSITORY):5000/$(IMAGE_NAME):latest
