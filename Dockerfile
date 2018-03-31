FROM ubuntu:14.04

MAINTAINER Carlo Eugster <carlo@relaun.ch>

RUN  apt-get update \
  && apt-get install -y wget xz-utils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /opt/factorio -s /bin/bash factorio \
  && chown -R factorio.factorio /opt/factorio
USER factorio

ENV HOME /opt/factorio
ENV SAVEFILE /opt/factorio/saves/factorio_save.zip
ENV SETTING /opt/factorio/saves/server-settings.json
WORKDIR /opt/factorio

RUN  wget -O -factorio.tar.gz https://www.factorio.com/get-download/latest/headless/linux64 \
  && tar -xpvf /tmp/factorio.tar.gz -C /opt \
  && rm -rf /tmp/factorio.tar.gz

ADD  init.sh /opt/factorio/

EXPOSE 34198/udp

CMD ["./init.sh"]
