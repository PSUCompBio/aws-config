#!/bin/bash
#
#INSTANCE_TYPE="ubuntu"
INSTANCE_TYPE="ami"
#

echo "SCRIPT START TIME"
date

echo " -------------------------------------------------------------------"
echo " ----------                Instance Type                      ------"
echo " -------------------------------------------------------------------"
echo $INSTANCE_TYPE
echo " -------------------------------------------------------------------"
echo " -------------------------------------------------------------------"
if [ "$INSTANCE_TYPE" == "ami" ]; then
        UNAMEX="ec2-user"
        HOME="/home/ec2-user"
        nproc
        NCPUS_VAR=$(nproc)
        echo "ncpus = $NCPUS_VAR"
        sudo yum update -y
        sudo amazon-linux-extras install docker -y
        sudo yum install git -y
        sudo service docker start
        sudo usermod -a -G docker $UNAMEX
elif [ "$INSTANCE_TYPE" == "ubuntu" ]; then
        UNAMEX="ubuntu"
        HOME="/home/ubuntu"
        sudo apt-get update
        sudo apt-get install docker.io -y
        sudo systemctl start docker
        sudo systemctl enable docker
else
        echo "Instance Type does not exist in config_bash script - please update it."
fi
echo " -------------------------------------------------------------------"
echo " ----------                   User Name                       ------"
echo " -------------------------------------------------------------------"
echo $UNAMEX
echo " -------------------------------------------------------------------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX


# clone specific branch
git clone -b ami-setup https://github.com/PSUCompBio/aws-config.git
# clone master branch
#git clone https://github.com/PSUCompBio/aws-config.git
cd aws-config/docker_scripts_$INSTANCE_TYPE
docker build \
      --build-arg INSTANCE_TYPE=${INSTANCE_TYPE} \
      --build-arg UNAMEX=${UNAMEX} \
      --build-arg NCPUS_VAR=${NCPUS_VAR} \
      -t nsfcareer.${INSTANCE_TYPE} .
cd /home/$UNAMEX
sudo chown -R $UNAMEX  *
