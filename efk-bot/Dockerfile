FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY bot.py .

RUN mkdir -p /fluentd/log && chmod -R 777 /fluentd/log

CMD ["python", "bot.py"]
