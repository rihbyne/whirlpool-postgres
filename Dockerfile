FROM postgres:12 as whirlpool-postgres
MAINTAINER Rihan Pereira <rihen234@gmail.com>

ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG WHIRLPOOL_USER
ARG WHIRLPOOL_USER_PWD
ARG WHIRLPOOL_DB

ENV PG_MAJOR 12
ENV POSTGRES_USER ${POSTGRES_USER}
ENV POSTGRES_PASSWORD ${POSTGRES_PASSWORD}
ENV WHIRLPOOL_USER ${WHIRLPOOL_USER}
ENV WHIRLPOOL_USER_PWD ${WHIRLPOOL_USER_PWD}
ENV WHIRLPOOL_DB ${WHIRLPOOL_DB}

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update \
  && apt-get install -y --no-install-recommends postgresql-client-$PG_MAJOR \
  && rm -rf /var/lib/apt/lists/*

ADD ./scripts/init-user-db.sh /docker-entrypoint-initdb.d/
