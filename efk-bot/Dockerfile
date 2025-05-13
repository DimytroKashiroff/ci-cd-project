FROM python:3.11-slim

WORKDIR /app

COPY bot.py .

RUN mkdir -p /fluentd/log

CMD ["python", "bot.py"]
