FROM lucdijkstra/ikdock_backend:latest

USER root

RUN apk update && \
    apk add mysql-client

COPY ./check-database.sh ./check-database.sh
RUN chmod +x ./check-database.sh

CMD sh ./check-database.sh && php artisan migrate:fresh --seed