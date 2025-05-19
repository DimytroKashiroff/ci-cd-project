import logging
import time
from datetime import datetime

logging.basicConfig(
    filename="/fluentd/log/bot.log",
    level=logging.INFO,
    format="[%Y-%m-%d %H:%M:%S] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S"
)

if __name__ == "__main__":
    while True:
        logging.info("Bot is running at {}".format(datetime.now().strftime("%H:%M:%S")))
        time.sleep(5)
