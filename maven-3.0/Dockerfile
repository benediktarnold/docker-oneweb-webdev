FROM node:4

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk

WORKDIR /opt
RUN wget https://archive.apache.org/dist/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz \
  && tar xfz apache-maven-3.0.5-bin.tar.gz
RUN ln -s /opt/apache-maven-3.0.5/bin/mvn /usr/local/bin/mvn

RUN npm install -g node-gyp-install
RUN node-gyp-install
RUN npm install -g node-sass
RUN npm install -g phantomjs
RUN npm install -g lite-server

RUN mkdir -p /opt/ci && chmod 777 /opt/ci
WORKDIR /opt/ci
