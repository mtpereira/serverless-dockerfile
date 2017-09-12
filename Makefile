VERSION = $(shell cat Dockerfile | awk '/SERVERLESS_VERSION=/ { split($$0, a, "=") ; print a[2]}')
IMAGE_NAME = serverless
IMAGE_TAG = $(VERSION)
GIT_TAG = v$(VERSION)

.PHONY: build run release clean

build: Dockerfile
		docker build --rm --tag $(IMAGE_NAME):$(IMAGE_TAG) -f Dockerfile .

run: build
		docker run --rm $(IMAGE_NAME):$(IMAGE_TAG)

release: run
		git tag v$(IMAGE_TAG) && git push && git push --tag

clean: 
		docker rmi $(IMAGE_NAME):$(IMAGE_TAG)