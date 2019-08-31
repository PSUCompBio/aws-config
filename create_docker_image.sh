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
        sudo yum update -y
        sudo yum install docker -y
        sudo yum install git -y
elif [ "$INSTANCE_TYPE" == "ubuntu" ]; then
        UNAMEX="ubuntu"
        HOME="/home/ubuntu"
        sudo apt-get update
        sudo apt-get install docker.io -y
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

sudo systemctl start docker
sudo systemctl enable docker
# clone specific branch
git clone -b ami-setup https://github.com/PSUCompBio/aws-config.git
# clone master branch
#git clone https://github.com/PSUCompBio/aws-config.git
cd aws-config/docker_scripts_$INSTANCE_TYPE
#docker build -t nsfcareer .
#cd /home/$UNAMEX
#sudo chown -R ubuntu *
