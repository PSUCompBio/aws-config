#!/bin/bash

 
INSTANCE="ubuntu"
WEBSITENAME="web"
#
#
echo " -------------------------------------------------------------------"
echo " ----------                Instance Type                      ------"
echo " -------------------------------------------------------------------"
echo $INSTANCE
echo " -------------------------------------------------------------------"
echo " -------------------------------------------------------------------"
if [ "$INSTANCE" == "ami" ]; then
        UNAMEX="ec2-user"
elif [ "$INSTANCE" == "ubuntu" ]; then
        UNAMEX="abby2"
        HOME="/home/abby2"
else
        echo "Instance Type does not exist in config_bash script - please update it."
fi
echo " -------------------------------------------------------------------"
echo " ----------                   User Name                       ------"
echo " -------------------------------------------------------------------"
echo $UNAMEX
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX
echo "Now in /home/$UNAMEX"
if [ "$INSTANCE" == "ami" ]; then
        sudo yum update -y
        sudo yum install -y git
        sudo yum install -y mesa-libGL
        sudo yum install -y mesa-libGL-devel
        sudo yum install -y mesa-libGLES
  sudo yum install -y mesa-libGLES-devel
  sudo yum install -y xorg-x11-server-Xvfb
  sudo yum groupinstall -y  "Development Tools"
elif [ "$INSTANCE" == "ubuntu" ]; then
        sudo apt-get update -y
        sudo apt-get install -y libgl1
        sudo apt-get install -y libxt6
        sudo apt-get install -y build-essential
        sudo apt-get install -y cmake-curses-gui
        sudo apt-get install -y xvfb
        sudo apt-get install -y nodejs npm
        sudo npm i -g npx
  	sudo apt-get install -y freeglut3-dev
        sudo apt-get install -y libblas-dev liblapack-dev
        sudo apt-get install -y openmpi-bin openmpi-common libopenmpi-dev
#
        sudo apt-get install -y python3-pip
        sudo pip3 install numpy matplotlib
        sudo apt-get install -y autotools-dev
        sudo apt-get install -y automake
  	sudo apt-get install -y libpcre3-dev
        sudo apt-get install -y bison
        sudo apt-get install -y byacc
        sudo apt-get install -y libfreetype6-dev
        sudo apt-get install -y pkg-config
  	sudo apt-get install -y libfontconfig1-dev
  	sudo apt-get install -y mdm
        #sudo apt-get install -y mayavi2
else
        echo "Instance Type does not exist in config_bash script - please update it."
fi
echo "alias l='ls -ltr' " >> /home/$UNAMEX/.bash_profile

echo "alias h='history' " >> /home/$UNAMEX/.bash_profile
echo "alias python='python3' " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile

echo " -------------------------------------------------------------------"
echo " ----------       Finished Installing Essential Dev Tools     ------"
echo " -------------------------------------------------------------------"



export UNAMEX

bash oce.sh &
bash occ.sh &
wait 

bash swig.sh &
bash vtk.sh &
bash pygem.sh &
bash mergepolydata.sh &
bash femtech.sh &

wait

bash assigning_permissions.sh
