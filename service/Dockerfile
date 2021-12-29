FROM maven:3.6.3-openjdk-11-slim

RUN apt-get update && apt-get install -y \
  netcat

COPY /scripts /scripts

WORKDIR /scripts

# fetch maven dependencies and plugins
RUN mvn process-resources -Dliquibase.skip=true

ENTRYPOINT ["/scripts/init.sh"]