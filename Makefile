VERSION = $(shell cat Dockerfile | awk '/SERVERLESS_VERSION=/ { split($$0, a, "=") ; print a[2]}')
IMAGE_NAME = serverless
IMAGE_TAG = $(VERSION)
IMAGE_REPO = quay.io/mtpereira
GIT_TAG = v$(VERSION)

.PHONY: build run push release clean

build: Dockerfile
		docker build --rm --tag $(IMAGE_REPO)/$(IMAGE_NAME):$(IMAGE_TAG) -f Dockerfile .

run: build
		docker run --rm $(IMAGE_NAME):$(IMAGE_TAG)

push: run
		docker push $(IMAGE_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)

release: push
		git tag $(GIT_TAG) && git push && git push --tag

clean: 
		docker rmi $(IMAGE_NAME):$(IMAGE_TAG)