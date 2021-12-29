#!/bin/bash
echo "STARTED"

set -e

DATABASE_HOSTNAME=${DATABASE_HOSTNAME:-localhost}
DATABASE_PORT=${DATABASE_PORT:-3306}

if [ -z "$DATABASE_SCHEMA" ];then
  echo "environment DATABASE_SCHEMA not set"
  exit 1
fi

if [ -z "$DATABASE_USERNAME" ];then
  echo "environment DATABASE_USERNAME not set"
  exit 1
fi

if [ -z "$DATABASE_PASSWORD" ];then
  echo "environment DATABASE_PASSWORD not set"
  exit 1
fi

echo "DATABASE_HOSTNAME: ${DATABASE_HOSTNAME}, DATABASE_PORT: ${DATABASE_PORT} DATABASE_SCHEMA: ${DATABASE_SCHEMA}, DATABASE_USERNAME: ${DATABASE_USERNAME}, DATABASE_PASSWORD: ****"

#Run check script
/scripts/database_connection.sh

cd /scripts

mvn -offline process-resources \
  -Dliquibase.url=jdbc:mysql://${DATABASE_HOSTNAME}:${DATABASE_PORT}/${DATABASE_SCHEMA}?createDatabaseIfNotExist=true \
  -Dliquibase.changeLogFile=changelog.xml \
  -Dliquibase.username=${DATABASE_USERNAME} \
  -Dliquibase.password=${DATABASE_PASSWORD}

echo "FINISHED"