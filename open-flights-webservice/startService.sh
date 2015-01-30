#!/bin/bash

export OPENFLIGHTS_SQL_PW="$SQL_PW"
echo "Starting Open Flights Web Service Daemon..."
(
    until java -Xms64m -Xmx512m -jar open-flights-webservice.jar -log DEBUG -sqlhost "$SQL_HOST" -sqlport "$SQL_PORT" -sqluser "$SQL_USER" -sqldb "$SQL_DB"; do
        echo "Open Flights Web Service  crashed with exit code $?.  Respawning... "
        sleep 5
    done
)
