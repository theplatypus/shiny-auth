FROM debian:latest 

USER root

################ ENV VAR ################

ENV BIND "0.0.0.0"
ENV PORT 3838

################ install utils ################

RUN apt-get update && \
	apt-get install -y wget r-base gdebi-core
	
################ install Shiny ################

RUN sh -c "R -e \"install.packages(c('shiny', 'rmarkdown', 'devtools'), repos='http://cran.rstudio.com/')\""

# dl .deb package:
RUN wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.7.907-amd64.deb

RUN gdebi --non-interactive shiny-server-1.5.7.907-amd64.deb

################ config shiny-server ########################

COPY ./config/shiny-server.conf /etc/shiny-server/shiny-server.conf
COPY ./docker/shiny-server/entrypoint.sh .

################ add an example app ################

COPY ./sample-apps /srv/shiny-server/sample-apps

################ ready to work ################

EXPOSE ${PORT}

CMD ["sh", "./entrypoint.sh"]
