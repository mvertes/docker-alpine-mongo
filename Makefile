VERSION = 3.2.1
IMAGE = mvertes/alpine-mongo:$(VERSION)

all:

image:
	docker build -t $(IMAGE) .

publish:
	docker push $(IMAGE)
