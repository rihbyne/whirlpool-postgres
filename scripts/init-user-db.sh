#!/bin/bash
set -e

psql -U postgres -c "\du";
psql -U postgres -c "CREATE USER ${WHIRLPOOL_USER} WITH PASSWORD '${WHIRLPOOL_USER_PWD}'";
psql -U postgres -c "CREATE DATABASE ${WHIRLPOOL_DB}";
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE ${WHIRLPOOL_DB} TO ${WHIRLPOOL_USER}";
