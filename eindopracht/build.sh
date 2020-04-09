#!/bin/bash

# Build the mariadb image
docker build -t ikdock_mariadb ./docker/database
docker tag ikdock_mariadb lucdijkstra/ikdock_mariadb:latest
docker push lucdijkstra/ikdock_mariadb

# Build the backend
docker build -t ikdock_backend -f ./docker/laravel/Dockerfile ./src/backend
docker tag ikdock_backend:latest lucdijkstra/ikdock_backend:latest
docker push lucdijkstra/ikdock_backend

# Build the migration image
docker build -t ikdock_migrations ./docker/migration
docker tag ikdock_migrations:latest lucdijkstra/ikdock_migrations:latest
docker push lucdijkstra/ikdock_migrations

# Build the frontend
docker build -t ikdock_frontend -f ./docker/react/Dockerfile ./src/frontend --build-arg BACKEND_URL=http://136.144.216.70:8000
docker tag ikdock_frontend:latest lucdijkstra/ikdock_frontend:latest
docker push lucdijkstra/ikdock_frontend

# Build the nginx container
docker build -t ikdock_nginx ./docker/nginx
docker tag ikdock_nginx:latest lucdijkstra/ikdock_nginx:latest
docker push lucdijkstra/ikdock_nginx

# Deploy the stack
docker stack deploy --compose-file ./docker-compose.yml ikdock_eindopdracht

# Force update the migrations, so they will run again
docker service update --force ikdock_eindopdracht_migrations
