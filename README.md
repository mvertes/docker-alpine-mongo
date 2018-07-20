[![license_badge](https://img.shields.io/github/license/mvertes/docker-alpine-mongo.svg)](https://github.com/mvertes/docker-alpine-mongo/blob/master/LICENSE)
[![docker_build_badge](https://img.shields.io/docker/automated/mvertes/alpine-mongo.svg)](https://hub.docker.com/r/mvertes/alpine-mongo/)
[![idocker_image_badge](https://images.microbadger.com/badges/image/mvertes/alpine-mongo.svg)](https://hub.docker.com/r/mvertes/alpine-mongo/)
[![docker_pulls_badge](https://img.shields.io/docker/pulls/mvertes/alpine-mongo.svg)](https://hub.docker.com/r/mvertes/alpine-mongo/)

This repository contains Dockerfile for [MongoDB 4.0](https://www.mongodb.org)
container, based on the [Alpine edge](https://hub.docker.com/_/alpine/) image.

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

To run a shell session:

    $ docker exec -ti mongo sh

To use the mongo shell client:

	$ docker exec -ti mongo mongo

The mongo shell client can also be run its own container: 

	$ docker run -ti --rm --name mongoshell mongo host:port/db

## Limitations

- On MacOSX, volumes located in a virtualbox shared folder are not
  supported, due to a limitation of virtualbox (default docker-machine
  driver) not supporting fsync().
