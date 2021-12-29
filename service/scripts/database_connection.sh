#!/bin/bash
STATUS=''
DATABASE_HOSTNAME=${DATABASE_HOSTNAME:-localhost}
DATABASE_PORT=${DATABASE_PORT:-3306}
SLEEP=${SLEEP:-1}
MAX_ATTEMPTS=${MAX_ATTEMPTS:-90}

for (( i=1 ; i<=MAX_ATTEMPTS ; i++ ));
do
  # -w 1 setup timeout
  STATUS=$(nc -w 1 $DATABASE_HOSTNAME $DATABASE_PORT &> /dev/null && echo "Online" || echo "Offline")
  echo "Connection status: $STATUS"
  if [ "$STATUS" = "Online" ]; then
    echo "Successfully connected to database: $DATABASE_HOSTNAME:$DATABASE_PORT [$i/$MAX_ATTEMPTS]"
    break
  else
    echo "Cannot connect to database: $DATABASE_HOSTNAME:$DATABASE_PORT [$i/$MAX_ATTEMPTS]"
    sleep $SLEEP
  fi
  if [ $i -eq "$MAX_ATTEMPTS" ]; then
    echo "Connection limit reached [$i/$MAX_ATTEMPTS]"
    exit 1
  fi
done
