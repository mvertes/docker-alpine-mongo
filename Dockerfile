From alpine:edge

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache mongodb
ADD run /

VOLUME /data/db
EXPOSE 27017 28017

ENTRYPOINT [ "/run" ]
CMD ["mongod"]
