FROM alpine:edge

RUN \
apk add --no-cache mongodb mongodb-tools && \
rm /usr/bin/mongoperf

VOLUME /data/db
EXPOSE 27017 28017

COPY import.sh /root
RUN /root/import.sh

COPY run.sh /root
ENTRYPOINT [ "/root/run.sh" ]
CMD [ "mongod" ]
