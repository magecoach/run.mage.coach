FROM ubuntu:latest
MAINTAINER Ray Bogman <bogman@bogman.info>

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      apt-utils \
      apt-transport-https \
      build-essential \
      curl \
      ca-certificates \
      git \
      lsb-release \
      python-all \
      rlwrap \
      vim \
      htop \
      iotop \
      net-tools \
 && rm -rf /var/lib/apt/lists/*;

RUN export USER=root;

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g node-gyp\
 && ln -s $(which node-gyp) $(dirname $(which node-gyp))/node-gyp\
 && npm cache clear\
 && node-gyp configure || echo ""

RUN git clone https://github.com/magecoach/run.mage.coach.git \
  && cd run.mage.coach/worker \
  && npm install -g

RUN curl -sSL https://get.docker.com/ | sh

ADD ./scripts/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

ADD ./scripts/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

ENV LOG_FILE /var/log/mage.coach/worker.log

VOLUME /var/lib/docker
CMD wrapdocker
