FROM ruby:3.1

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    gnupg \
    apt-transport-https \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

RUN gem install fluentd -v "~> 1.14" --no-document

RUN gem install fluent-plugin-elasticsearch -v 5.0.3 --no-document

COPY fluent.conf /fluentd/etc/fluent.conf

RUN mkdir -p /fluentd/log && chown -R nobody /fluentd
WORKDIR /fluentd

USER nobody

CMD ["fluentd", "-c", "/fluentd/etc/fluent.conf", "-v"]
