FROM python:3.7

COPY . /usr/app

WORKDIR /usr/app

RUN pip install -r requirements.txt

RUN export $(cat .env | xargs)

CMD [ "python3", "hello.py" ]