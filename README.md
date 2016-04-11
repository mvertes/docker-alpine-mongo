# docker-alpine-mongo

This repository contains Dockerfile for [MongoDB 3.2](https://www.mongodb.org)
container, based on the [Alpine 3.3](https://hub.docker.com/_/alpine/) image.

Why ? the official mongo image size: 317 MB, alpine-mongo: 133 MB

## Install

As a prerequisite, you need [Docker](https://docker.com) to be installed.

To download this image from the public docker hub:

	$ docker pull mvertes/alpine-mongo

To re-build this image from the dockerfile:

	$ docker build -t mvertes/alpine-mongo .

## Usage

To run `mongod`:

	$ docker run -d --name mongo -p 27017:27017 mvertes/alpine-mongo

You can also specify the database repository where to store the data
with the volume -v option:

    $ docker run -d --name mongo -p 27017:27017 \
	  -v /somewhere/onmyhost/mydatabase:/data/db \
	  mvertes/alpine-mongo

Now, on the same host where the mongodb container is running, to trace
database network activity in real-time:

	$ docker exec -ti mongo mongosniff

To run a shell session:

    $ docker exec -ti mongo sh

To use the mongo shell client:

	$ docker exec -ti mongo mongo

The mongo shell client can also be run its own container: 

	$ docker run -ti --rm --name mongoshell monogo host:port/db

## Limitations

- On MacOSX, volumes located in a virtualbox shared folder are not
  supported, due to a limitation of virtualbox (default docker-machine
  driver) not supporting fsync().
