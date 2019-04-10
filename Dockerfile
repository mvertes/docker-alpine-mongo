FROM alpine:edge

RUN apk add --no-cache mongodb

VOLUME /data/db

COPY run.sh /root
ENTRYPOINT [ "/root/run.sh" ]
CMD [ "mongod", "--bind_ip", "0.0.0.0" ]
