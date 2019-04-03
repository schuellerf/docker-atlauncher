FROM openjdk:8
MAINTAINER Florian Schüller <florian.schueller@gmail.com>

EXPOSE 5901 25565

RUN adduser atlauncher --disabled-login
RUN adduser atlauncher sudo

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install \
    wget \
    lxde-core \
    tightvncserver && \
    rm -rf /var/lib/apt/lists/*


RUN mkdir -p /home/atlauncher
WORKDIR /home/atlauncher

RUN wget https://download.nodecdn.net/containers/atl/ATLauncher.jar

RUN mkdir /home/atlauncher/data
WORKDIR /home/atlauncher/data

COPY entrypoint.sh /home/atlauncher/entrypoint.sh

RUN chmod +x /home/atlauncher/entrypoint.sh

RUN chown -R atlauncher /home/atlauncher

ARG VNCPASS_DEFAULT=letmein
ENV VNCPASS=$VNCPASS_DEFAULT

USER atlauncher
ENV USER atlauncher

CMD ["/home/atlauncher/entrypoint.sh"]
