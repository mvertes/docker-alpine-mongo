From alpine:edge

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache mongodb
RUN mkdir -p /data/db && chown -R mongodb /data/db && chmod +s /usr/bin/mongosniff

VOLUME /data/db
USER mongodb
WORKDIR /var/lib/mongodb

EXPOSE 27017 28017

CMD ["mongod"]
