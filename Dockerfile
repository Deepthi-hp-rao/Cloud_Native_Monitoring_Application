FROM python:3.12.0b4-slim

WORKDIR /app

COPY requirements.txt /app

RUN apt-get update && \
    apt-get install -y gcc python3-dev

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /app

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 9001

CMD ["flask", "run"]