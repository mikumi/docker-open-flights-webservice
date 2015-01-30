FROM ubuntu:trusty
MAINTAINER Michael Kuck <me@michael-kuck.com>

ENV DEBIAN_FRONTEND noninteractive

# Install Java.
RUN apt-get install -y software-properties-common
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

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
