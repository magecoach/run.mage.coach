FROM ubuntu:14.04
MAINTAINER Ray Bogman <bogman@bogman.info>

RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    vim \
    lxc \
    iptables \
    git \
    nodejs \
    build-essential \
    npm --no-install-recommends && \
    ln -s /usr/bin/nodejs /usr/local/bin/node && \
    git clone https://github.com/magecoach/run.mage.coach.git && \
    cd run.mage.coach/worker && \
    npm install -g && \
    npm cache clean && \
    apt-get purge -y npm git build-essential && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL https://get.docker.com/ | sh

ADD ./scripts/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
ADD ./scripts/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Define additional metadata for our image.
ENV LOG_FILE /var/log/mage.coach/worker.log
VOLUME /var/lib/docker
CMD wrapdocker
