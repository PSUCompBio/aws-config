#!/bin/bash
  
echo $USER

if [ $(which docker 2>/dev/null) ]; then
  echo "docker present"
else
  apt-get install docker.io
fi

sudo usermod -a -G docker $USER

echo "Docker has been installed and its version is : "

sudo docker --version

sudo service docker start

sudo docker pull vradars/brain_radar:1.0

sudo docker run -it -p 80:3000 vradars/brain_radar:1.0
