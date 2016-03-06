FROM node:4

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk

WORKDIR /opt
RUN wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
  && tar xfz apache-maven-3.3.9-bin.tar.gz \
  && rm apache-maven-3.3.9-bin.tar.gz
RUN ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn

ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 phantomjs.tar.bz2
RUN tar xfj phantomjs.tar.bz2 && rm phantomjs.tar.bz2 && ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

RUN npm install -g node-gyp-install
RUN node-gyp-install
RUN npm install -g node-sass
RUN npm install -g lite-server

RUN mkdir -p /opt/ci && chmod 777 /opt/ci
RUN mkdir -p /var/opt/data/maven/local && chmod 777 /var/opt/data/maven/local
WORKDIR /opt/ci
