FROM python:3.11-slim

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файл bot.py до контейнера
COPY bot.py .

# Якщо є requirements.txt, копіюємо і встановлюємо залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Створюємо директорію для Fluentd логів
RUN mkdir -p /fluentd/log

# Вказуємо команду для запуску вашого бота
CMD ["python", "bot.py"]
