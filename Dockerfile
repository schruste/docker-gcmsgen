FROM ubuntu:latest

WORKDIR /home/app
        
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
                
RUN apt-get update
RUN apt-get install -y software-properties-common
# RUN add-apt-repository universe
RUN apt-get install bibtex2html -y
RUN apt-get install npm nodejs -y
RUN apt-get install git
RUN git clone https://gitlab.gwdg.de/nam/gcmsgen.git
WORKDIR /home/app/gcmsgen
RUN npm install
RUN export PATH="$PATH:/home/app/gcmsgen/bin"         
