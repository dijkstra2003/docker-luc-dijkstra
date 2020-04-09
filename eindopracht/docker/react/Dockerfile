FROM node:latest as build

WORKDIR /app

ENV NODE_ENV production

COPY package.json /app/package.json
RUN npm install
RUN npm install -g create-react-app

ARG BACKEND_URL

COPY . /app

RUN REACT_APP_API_URL=$BACKEND_URL npm run build

FROM nginx:latest

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
