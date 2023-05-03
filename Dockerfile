FROM google/cloud-sdk:alpine

ENV PYTHONUNBUFFERED=1

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories

RUN apk add --no-cache mongodb-tools gnupg

ADD . /app

RUN chmod +x /app/backup.sh

CMD ["/app/backup.sh"]

