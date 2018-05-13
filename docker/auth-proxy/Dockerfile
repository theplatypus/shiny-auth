FROM debian:latest

USER root

ENV SHINY_URI "http://127.0.0.1:3838/"
ENV PORT "8080"

RUN apt-get update && \
	apt-get install -y wget gnupg apache2-utils

################ install nginx ################

RUN apt-get install -y nginx

################ config nginx ################

COPY ./config/nginx.conf /etc/nginx/nginx.conf

RUN touch /etc/nginx/.htpasswd && \
	touch /var/log/nginx/error.log
	
COPY ./docker/auth-proxy/entrypoint.sh .

EXPOSE ${PORT}

CMD ["sh", "./entrypoint.sh"]
