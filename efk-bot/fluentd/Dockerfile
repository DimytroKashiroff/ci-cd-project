FROM ruby:3.1 

# Встановлюємо потрібні утиліти
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    gnupg \
    apt-transport-https \
    lsb-release \
 && rm -rf /var/lib/apt/lists/*

# Встановлюємо Fluentd, плагін Elasticsearch та elasticsearch-transport gem
RUN gem install fluentd -v "~> 1.14" --no-document \
 && gem install fluent-plugin-elasticsearch -v 5.0.3 --no-document \
 && gem install elasticsearch -v 7.17.10 --no-document

# Копіюємо конфігурацію
COPY fluent.conf /fluentd/etc/fluent.conf

# Створюємо необхідні директорії і даємо права
RUN mkdir -p /fluentd/log /fluentd/etc \
 && chown -R nobody:nogroup /fluentd

WORKDIR /fluentd
USER nobody

CMD ["fluentd", "-c", "/fluentd/etc/fluent.conf", "-v"]
