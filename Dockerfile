FROM alpine:3

ENV PYTHONUNBUFFERED=1

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories

RUN apk add --no-cache mongodb-tools python3 py3-pip

RUN pip3 install --upgrade --no-cache gsutil

ADD . /app

CMD ["/app/backup.sh"]

