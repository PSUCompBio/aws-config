FROM ubuntu
ARG UNAMEX=ubuntu
RUN echo "'UNAMEX=${UNAMEX}'"

RUN apt-get update -y
RUN apt-get install -y git

# Setup home environment
RUN useradd ${UNAMEX}

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
COPY bash_scripts /home/${UNAMEX}/bash_scripts
COPY TestingProcedures.md /home/${UNAMEX}
RUN ls -ltr
#RUN /bin/bash config_bash.sh
RUN /bin/bash bash_scripts/inital-setup.sh
