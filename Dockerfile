FROM ubuntu:16.04
MAINTAINER Andrey Fedoseev <andrey.fedoseev@gmail.com>
RUN apt-get update && apt-get install -y python2.7-dev python3.5-dev python-pip sqlite3 ruby-dev npm
RUN ln -s /usr/bin/nodejs /usr/local/bin/node
RUN npm install -g coffee-script@1.7.1
RUN npm install -g livescript@1.4.0
RUN npm install -g less@1.7.4
RUN npm install -g babel-cli@6.2.0
RUN npm install -g stylus@0.50.0
RUN npm install -g handlebars@4.0.2
RUN gem install sass -v 3.4.22
RUN gem install compass -v 1.0.1
RUN mkdir /app
WORKDIR /app
ADD requirements-*.txt /app/
RUN pip install -r requirements-dev.txt
ADD . /app/
RUN pip install -e .[libsass]
