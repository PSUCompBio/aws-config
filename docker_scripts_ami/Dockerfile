FROM amazonlinux:2
ARG UNAMEX=ami
RUN echo "'UNAMEX=${UNAMEX}'"

RUN yum update -y
RUN yum install git -y
RUN yum install python3 -y
RUN yum install curl -y
RUN yum install vim -y
RUN yum install pkgconfig -y
RUN yum install cmake -y
RUN yum install make automake gcc gcc-c++ kernel-devel -y 
