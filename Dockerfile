FROM ubuntu:trusty
MAINTAINER Michael Kuck <me@michael-kuck.com>

ENV DEBIAN_FRONTEND noninteractive

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jre && \
  rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN apt-get clean autoclean autoremove

ADD open-flights-webservice /open-flights-webservice

# Exposed ENV
ENV SQL_HOST localhost
ENV SQL_PORT 3306
ENV SQL_USER admin
ENV SQL_PW 0
ENV SQL_DB open_flights

EXPOSE 8881

WORKDIR /open-flights-webservice
CMD ["/open-flights-webservice/startService.sh"]
