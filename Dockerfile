From alpine:edge

ADD run /
ADD https://raw.githubusercontent.com/mvertes/dosu/0.1.0/dosu /sbin/

RUN chmod +x /sbin/dosu && \
  echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache mongodb

VOLUME /data/db
EXPOSE 27017 28017

ENTRYPOINT [ "/run" ]
CMD [ "mongod" ]
