IMAGE = mvertes/alpine-mongo

all:

image:
	docker build -t $(IMAGE) .

publish:
	docker push $(IMAGE)
