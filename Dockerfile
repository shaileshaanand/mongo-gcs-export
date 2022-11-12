FROM mongo:5-focal

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates gnupg curl
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

RUN apt-get update && apt-get install google-cloud-cli -y

RUN apt remove -y curl
RUN apt clean && rm -rf /var/lib/apt/lists/*

ADD . /app

CMD ["/app/backup.sh"]

