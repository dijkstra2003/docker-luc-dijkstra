# use the mysql image
FROM mysql

# Set the environment variables
ENV MYSQL_DATABASE demo-joel
ENV MYSQL_ROOT_PASSWORD my-secret
ENV MYSQL_USER joel
ENV MYSQL_PASSWORD db-docker

#copy demo-joel.sql into /docker-entryppoint-initdb.d to start the sql script on startup.
COPY demo-joel.sql /docker-entrypoint-initdb.d
