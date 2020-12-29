FROM ubuntu:20.10
ENV LANG C.UTF-8

ENV TERM xterm

RUN set -x && \
    apt update && \
    apt install -y sudo && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 developer && \
    useradd  -g      developer -G sudo -m -s /bin/bash testuser && \
    echo 'testuser:hogehoge' | chpasswd

RUN echo 'Defaults visiblepw'              >> /etc/sudoers
RUN echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

COPY package_install.sh .
COPY Brewfile .
RUN ./package_install.sh

COPY setup.sh .
RUN ./setup.sh
