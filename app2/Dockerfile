FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev

COPY ./requirements.txt /app/requirements.txt
COPY ./constants.py /app/constants.py
WORKDIR /app
RUN pip3 install -r requirements.txt
COPY . /app
EXPOSE 9090
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]
