FROM amazonlinux:2

ARG UNAMEX
ARG INSTANCE_TYPE
ARG NCPUS_VAR
RUN echo "'UNAMEX=${UNAMEX}'"
RUN echo "'INSTANCE_TYPE=${INSTANCE_TYPE}'"
RUN echo "'NCPUS_VAR=${NCPUS_VAR}'"

RUN yum update -y
RUN yum install -y git
RUN yum install -y python3 python3-devel
RUN yum install -y curl
RUN yum install -y vim
RUN yum install -y tar
RUN yum install -y bzip2
RUN yum install -y pkgconfig
RUN yum install -y cmake cmake3
RUN yum install -y make automake gcc gcc-c++ kernel-devel
RUN yum install -y openmpi openmpi-devel
RUN yum install -y aws-cli

# Setup home environment
RUN useradd ${UNAMEX}
ARG VTK_ROOT=/home/${UNAMEX}/VTK
ARG LD_LIBRARY_PATH=/usr/local/lib

WORKDIR /home/${UNAMEX}
ENV HOME /home/${UNAMEX}
RUN chown -R ${UNAMEX} /home/${UNAMEX}

RUN cd /home/${UNAMEX}
RUN pwd
COPY bash_scripts /home/${UNAMEX}/bash_scripts
COPY bash_scripts/bashrc /home/${UNAMEX}/.bashrc
COPY bash_scripts/bash_profile /home/${UNAMEX}/.bash_profile
COPY TestingProcedures.md /home/${UNAMEX}

RUN /bin/bash bash_scripts/inital-setup.sh
RUN /bin/bash bash_scripts/install-swig.sh
RUN /bin/bash bash_scripts/install-tcl.sh
RUN /bin/bash bash_scripts/install-paraview.sh
RUN /bin/bash bash_scripts/install-paraview-image-write.sh
RUN /bin/bash bash_scripts/install-python-image-write.sh
RUN /bin/bash bash_scripts/install-oce.sh
RUN /bin/bash bash_scripts/install-occ.sh
RUN /bin/bash bash_scripts/install-pygem.sh
RUN /bin/bash bash_scripts/install-vtk-src.sh
RUN /bin/bash bash_scripts/install-MergePolyData.sh
RUN /bin/bash bash_scripts/install-rbf.sh
# #RUN /bin/bash bash_scripts/install-simple-nodejs-app.sh
RUN /bin/bash bash_scripts/install-nsfcareer-api-service.sh
RUN /bin/bash bash_scripts/install-complete.sh

##RUN /bin/bash bash_scripts/install-femtech.sh
# RUN /bin/bash bash_scripts/install-google-drive.sh
##RUN /bin/bash bash_scripts/install-mesa-vtk.sh
### this is provided my MergePolyData-ImageWrite RUN /bin/bash bash_scripts/install-projectedtexture.sh
### don't need this.... RUN /bin/bash bash_scripts/install-qt5.sh
### vtk now provided by paraview .... do not need. RUN /bin/bash bash_scripts/install-pip-vtk.sh

# expose port 4000 for nsfcareer-api-service
EXPOSE 4000

# set up a script that run whenever the docker is started.
# it will run the forever service to start the nsfcareer-api-service
RUN ["chmod", "+x", "/home/ec2-user/bash_scripts/start-nodejs.sh"]
#ENTRYPOINT ["/bin/bash", "-c", "/home/ec2-user/bash_scripts/start-nodejs.sh"]
#CMD ["/bin/bash", "-c", "/home/ec2-user/bash_scripts/start-nodejs.sh"]
#RUN /bin/bash bash_scripts/start-nodejs.sh

# clean up and setup
RUN /bin/bash -c "source .bashrc"
RUN chown -R ${UNAMEX} /home/${UNAMEX}
