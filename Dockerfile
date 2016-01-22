FROM node:4

RUN npm install -g node-gyp-install
RUN node-gyp-install
RUN npm install -g node-sass
RUN npm install -g phantomjs
RUN npm install -g lite-server
