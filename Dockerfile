# Dockerfile
FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_USER=testuser
ENV MYSQL_PASSWORD=testpassword

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
