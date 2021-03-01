FROM ubuntu:18.04
ARG UNAMEX=ubuntu

RUN echo "'UNAMEX=${UNAMEX}'"

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get install -y git apt-utils
RUN apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install nodejs -yq

# Setup home environment
RUN useradd ${UNAMEX}
ARG VTK_ROOT=/home/${UNAMEX}/VTK
ARG LD_LIBRARY_PATH=/usr/local/lib

# below does not need to be done since on AWS ubuntu instances
# ubuntu user is added by default
# it could be useful if we change user name
#RUN mkdir /home/${UNAMEX} && chown -R ${UNAMEX}: /home/${UNAMEX}

WORKDIR /home/${UNAMEX}
ENV HOME /home/${UNAMEX}
RUN touch /home/${UNAMEX}/.bash_profile
RUN chown -R ${UNAMEX} /home/${UNAMEX}

RUN cd /home/${UNAMEX}
RUN pwd
