#!/bin/bash
#
cd /home/$UNAMEX
echo "Now in /home/$UNAMEX"

sudo yum install -y mesa-libGL
sudo yum install -y mesa-libGL-devel
sudo yum install -y mesa-libGLES
sudo yum install -y mesa-libGLES-devel
sudo yum install -y xorg-x11-server-Xvfb
sudo yum groupinstall -y  "Development Tools"}

echo "alias l='ls -ltr' " >> /home/$UNAMEX/.bash_profile
echo "alias h='history' " >> /home/$UNAMEX/.bash_profile
echo "alias python='python3' " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
sleep 5
/usr/bin/ncpus
NCPUS_VAR=$(ncpus)
echo "ncpus = $NCPUS_VAR"
echo " -------------------------------------------------------------------"
echo " ----------       Finished Installing Essential Dev Tools     ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
