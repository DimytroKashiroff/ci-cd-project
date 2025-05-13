import logging
import time
import random

logger = logging.getLogger("efk-bot")
logger.setLevel(logging.INFO)
handler = logging.FileHandler("/fluentd/log/bot.log")
formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)

messages = ["Бот запущено", "Обробка даних", "Успішне з'єднання", "Помилка з'єднання", "Передача завершена"]

if __name__ == "__main__":
    while True:
        msg = random.choice(messages)
        logger.info(msg)
        time.sleep(5)
