FROM amazonlinux:2
ARG UNAMEX=ami
RUN echo "'UNAMEX=${UNAMEX}'"

RUN yum update -y
RUN yum install git -y
RUN yum install python3 -y

#RUN apt-get install -y curl
#RUN apt-get install -y vim
#RUN apt-get install -y pkg-config
#RUN apt-get install -y cmake
#RUN apt-get install -y build-essential
#RUN apt-get install -y git apt-utils
