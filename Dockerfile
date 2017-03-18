FROM openjdk:8u121-jre
MAINTAINER Jon Schulberger <jschoulzy@gmail.com>

EXPOSE 25565

RUN apt-get update && \
    apt-get -y install \
    wget \
    lxde-core \
    tightvncserver && \
    rm -rf /var/lib/apt/lists/*
    
WORKDIR /root

RUN wget https://download.nodecdn.net/containers/atl/ATLauncher.jar

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
