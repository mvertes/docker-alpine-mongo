FROM alpine:edge

RUN apk add --no-cache mongodb mongodb-tools

VOLUME /data/db
VOLUME /data/dump
EXPOSE 27017 28017

COPY run.sh /root
ENTRYPOINT [ "/root/run.sh" ]
CMD [ "mongod", "--bind_ip", "0.0.0.0" ]
