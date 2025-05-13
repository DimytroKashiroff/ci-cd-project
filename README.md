Hello docker

✅ Тепер виконай такі кроки:
Встанови потрібну бібліотеку:

bash
Копировать
Редактировать
gem install faraday-net_http -v 3.0.2
Після цього — повторно встанови плагін:

bash
Копировать
Редактировать
gem install fluent-plugin-elasticsearch --no-document
Коли обидва встановлення завершаться успішно — перезапусти docker-compose:

bash
Копировать
Редактировать
sudo docker-compose up --build

