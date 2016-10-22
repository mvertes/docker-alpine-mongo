FROM alpine:edge

RUN \
echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
apk add --no-cache mongodb && \
rm /usr/bin/mongosniff /usr/bin/mongoperf

VOLUME /data/db
EXPOSE 27017 28017

COPY run.sh /
ENTRYPOINT [ "/run.sh" ]
CMD [ "mongod" ]
