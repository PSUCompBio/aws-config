FROM amazonlinux:2
ARG UNAMEX=ec2_user
ARG INSTANCE_TYPE=ami
RUN echo "'UNAMEX=${UNAMEX}'"
RUN echo "'INSTANCE_TYPE=${INSTANCE_TYPE}'"

RUN yum update -y
RUN yum install git -y
RUN yum install python3 -y
RUN yum install curl -y
RUN yum install vim -y
RUN yum install pkgconfig -y
RUN yum install cmake -y
RUN yum install make automake gcc gcc-c++ kernel-devel -y

# Setup home environment
RUN useradd ${UNAMEX}
ARG VTK_ROOT=/home/${UNAMEX}/VTK
ARG LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /home/${UNAMEX}
ENV HOME /home/${UNAMEX}
RUN touch /home/${UNAMEX}/.bash_profile
RUN chown -R ${UNAMEX} /home/${UNAMEX}


RUN cd /home/${UNAMEX}
RUN pwd
COPY bash_scripts /home/${UNAMEX}/bash_scripts
COPY TestingProcedures.md /home/${UNAMEX}
