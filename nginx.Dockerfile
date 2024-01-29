FROM nginx:alpine

WORKDIR /app
COPY ./static .
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf