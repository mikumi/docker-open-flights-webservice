FROM mikumi/java:oracle-jdk8
MAINTAINER Michael Kuck <me@michael-kuck.com>

RUN useradd -ms /bin/bash service

ADD open-flights-webservice /open-flights-webservice

# Exposed ENV
ENV OPENFLIGHTS_SQL_HOST localhost
ENV OPENFLIGHTS_SQL_PORT 3306
ENV OPENFLIGHTS_SQL_USER admin
ENV OPENFLIGHTS_SQL_PW 0
ENV OPENFLIGHTS_SQL_DB open_flights

EXPOSE 8891

WORKDIR /open-flights-webservice

USER service

CMD java -Xms64m -Xmx512m -jar open-flights-webservice.jar -log DEBUG -sqlhost "$OPENFLIGHTS_SQL_HOST" -sqlport "$OPENFLIGHTS_SQL_PORT" -sqluser "$OPENFLIGHTS_SQL_USER" -sqldb "$OPENFLIGHTS_SQL_DB"
