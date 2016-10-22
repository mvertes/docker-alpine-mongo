FROM alpine:edge

COPY run.sh /run.sh

RUN \
echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
apk add --no-cache mongodb && \
rm /usr/bin/mongosniff /usr/bin/mongoperf && \
printf '#!/bin/sh\n\
[ $# -lt 2 ] && echo "Usage: dosu user command [args...]" >&2 && exit 1\n\
user=$1\nshift\ncmd=exec\nfor i; do cmd="$cmd %s$i%s"; done\n\
exec su -s /bin/sh -c "$cmd" "$user"\n' "'" "'" > /sbin/dosu && \
chmod +x /sbin/dosu

VOLUME /data/db
EXPOSE 27017 28017

ENTRYPOINT [ "/run.sh" ]
CMD [ "mongod" ]
