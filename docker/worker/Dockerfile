FROM sitespeedio/sitespeed.io:latest
MAINTAINER Ray Bogman <bogman@bogman.info>

## Should rarely change, set early in build
ADD ./scripts/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENV LOG_FILE /var/log/mage.coach/worker.log
ENTRYPOINT start.sh

## Install required packages
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551
RUN apt-get update -qqy
RUN apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables \
    build-essential \
    libkrb5-dev \
    npm --no-install-recommends

## Install worker code
RUN git clone github.com/magecoach/run.mage.coach.git && \
    cd run.mage.coach/worker/ && \
    npm install -g && \
    npm cache clean

## replaces git clone. for quick dev, use COPY of local files
#COPY worker /worker
#RUN cd /worker && \
#    npm install -g
#    npm cache clean

#cleanup
RUN apt-get purge -y npm git build-essential && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
