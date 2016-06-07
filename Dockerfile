FROM node:4

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk apt-transport-https ca-certificates \
  && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list
RUN apt-get update \
  && apt-get install -y docker-engine=1.7.1-0~jessie
RUN mkdir -p /opt/ci && chmod 777 /opt/ci
WORKDIR /opt/ci
RUN wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
  && tar xfz apache-maven-3.3.9-bin.tar.gz \
  && rm apache-maven-3.3.9-bin.tar.gz
RUN ln -s /opt/ci/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn

WORKDIR /opt
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs.tar.bz2
RUN tar xfj phantomjs.tar.bz2 && rm phantomjs.tar.bz2 && ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

WORKDIR /opt/ci
RUN npm install -g node-gyp-install
RUN node-gyp-install

RUN mkdir -p /var/opt/data/maven/local && chmod 777 /var/opt/data/maven/local

