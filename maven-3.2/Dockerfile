FROM node:4

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update \
  && apt-get install -y openjdk-8-jdk

WORKDIR /opt
RUN wget https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz \
  && tar xfz apache-maven-3.2.5-bin.tar.gz
ENV PATH=$PATH:/opt/apache-maven-3.2.5/bin

RUN npm install -g node-gyp-install
RUN node-gyp-install
RUN npm install -g node-sass
RUN npm install -g phantomjs
RUN npm install -g lite-server
