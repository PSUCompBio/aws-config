FROM ubuntu

ENV UNAMEX=dev
ENV WEBSITENAME=web

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential

RUN apt-get install -y git apt-utils


#RUN npm i -g npx


# Setup home environment
RUN useradd ubuntu

COPY config_bash.sh .
#RUN ls /home/ubuntu
#RUN usermod -aG docker ubuntu
RUN mkdir /home/ubuntu && chown -R ubuntu: /home/ubuntu
RUN mkdir -p /home/ubuntu/bin /home/ubuntu/lib /home/ubuntu/include
ENV PATH /home/ubuntu/bin:$PATH
ENV PKG_CONFIG_PATH /home/ubuntu/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/ubuntu/lib

# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R ubuntu:ubuntu /var/shared
VOLUME /var/shared

WORKDIR /home/ubuntu
ENV HOME /home/ubuntu
#ADD vimrc /home/ubuntu/.vimrc
#ADD vim /home/ubuntu/.vim
RUN touch /home/ubuntu/.bash_profile
RUN touch /home/ubuntu/.gitconfig

# Link in shared parts of the home directory
RUN ln -s /var/shared/.ssh
RUN ln -s /var/shared/.bash_history
RUN ln -s /var/shared/.maintainercfg

RUN chown -R ubuntu: /home/ubuntu

RUN chmod +x /config_bash.sh

RUN ls -la /config_bash.sh
RUN /bin/bash -c "/config_bash.sh"
RUN cd web && npm start
USER ubuntu

