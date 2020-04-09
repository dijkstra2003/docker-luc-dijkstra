FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./home.py /app

EXPOSE 5000

ENTRYPOINT [ "python" ]

CMD [ "home.py" ]
