FROM postgres:10.1-alpine 

WORKDIR /app

COPY init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 5432