FROM ruby:3.1

RUN apt-get update && apt-get install -y \

    sudo curl gnupg apt-transport-https lsb-release \

 && rm -rf /var/lib/apt/lists/*

RUN gem install fluentd -v "~> 1.14" --no-document \

 && gem install fluent-plugin-elasticsearch -v 4.8.4 --no-document \

 && gem install elasticsearch-transport --no-document

COPY fluent.conf /fluentd/etc/fluent.conf

RUN mkdir -p /fluentd/log /fluentd/etc \

 && chown -R nobody:nogroup /fluentd

WORKDIR /fluentd
USER nobody

CMD ["fluentd", "-c", "/fluentd/etc/fluent.conf", "-v"]
