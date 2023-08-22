FROM python:3.9-bullseye

WORKDIR /app

COPY requirements.txt /app

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /app

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 9001

CMD ["flask", "run"]