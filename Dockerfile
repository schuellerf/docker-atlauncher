FROM openjdk:8u121-jre
MAINTAINER Jon Schulberger <jschoulzy@gmail.com>

EXPOSE 5901 25565

RUN adduser atlauncher --disabled-login
RUN adduser atlauncher sudo

RUN apt-get update && \
    apt-get -y install \
    wget \
    lxde-core \
    tightvncserver && \
    rm -rf /var/lib/apt/lists/*

USER atlauncher

RUN mkdir -p /home/atlauncher/ATLauncher
WORKDIR /home/atlauncher/ATLauncher

RUN wget https://download.nodecdn.net/containers/atl/ATLauncher.jar

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
