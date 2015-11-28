# docker-alpine-mongo

This repository contains Dockerfile for [MongoDB](https://www.mongodb.org) container,
based on the [Alpine](https://hub.docker.com/_/alpine/) image.

## Install

As a prerequisite, you need [Docker](https://docker.com) to be installed.

To download this image from the public docker hub:

	$ docker pull mvertes/alpine-mongo

To re-build this image from the dockerfile:

	$ docker build -t mvertes/alpine-mongo .

## Usage

To run `mongod`:

	$ docker run -d -p 27017:27017 mvertes/alpine-mongo

