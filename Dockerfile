FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install futu-api pyyaml

COPY ./main.py /opt/futu-grid-trading/main.py
COPY ./trade /opt/futu-grid-trading/trade
COPY ./scripts /opt/futu-grid-trading/scripts

WORKDIR /opt/futu-grid-trading
