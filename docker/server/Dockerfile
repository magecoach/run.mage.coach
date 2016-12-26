FROM ubuntu:latest
MAINTAINER Ray Bogman <bogman@bogman.info>

RUN apt-get update \
 && apt-get install -y --no-install-recommends\
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

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g node-gyp\
 && ln -s $(which node-gyp) $(dirname $(which node-gyp))/node-gyp\
 && npm cache clear\
 && node-gyp configure || echo ""

RUN git clone https://github.com/magecoach/run.mage.coach.git \
 && cd run.mage.coach/server \
 && npm install -g

ADD ./scripts/ /home/root/scripts

ENV LOG_FILE /var/log/mage.coach/server.log

ENTRYPOINT ["/home/root/scripts/start.sh"]

EXPOSE 3000

RUN apt-get update \
 && apt-get upgrade -y \
 && rm -rf /var/lib/apt/lists/*;
