FROM consul:1.9

RUN \
    wget https://releases.hashicorp.com/consul-template/0.25.1/consul-template_0.25.1_linux_amd64.zip -O temp.zip \
    && unzip -d /usr/local/bin temp.zip \
    && rm temp.zip

RUN \
    apk update \
    && apk add supervisor \
    && apk add bind-tools curl jq vim

RUN echo 'alias sc=supervisorctl' >> ~/.profile

RUN \
    mkdir -p /consul/data \
    && mkdir -p /consul/config
COPY consul/config /consul/config
COPY supervisord /etc

CMD [ "supervisord" ]
