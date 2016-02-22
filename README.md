oneWeb - Web Tool Stack
=======================

node.js base image with node-gyp and some other tools preinstalled:

* java
* maven
* node-gyp
* node-sass
* lite-server
* phantomjs

Usage
-----

```
FROM benediktarnold/oneweb-webdev

ADD . /src
WORKDIR /src

RUN npm link node-sass
RUN npm link lite-server
RUN npm link phantomjs
```
