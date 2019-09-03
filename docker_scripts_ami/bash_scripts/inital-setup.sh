#!/bin/bash
#
cd /home/$UNAMEX
echo "Now in /home/$UNAMEX"
yum install -y wget
yum install -y mesa-libGL
yum install -y mesa-libGL-devel
yum install -y mesa-libGLES
yum install -y mesa-libGLES-devel
yum install -y xorg-x11-server-Xvfb
yum install -y libXt-devel
yum install -y mesa-libOSMesa.x86_64 mesa-libOSMesa-devel.x86_64
yum install -y mesa-libEGL-devel
yum install -y openmpi openmpi-devel
echo "alias l='ls -ltr' " >> /home/$UNAMEX/.bash_profile
echo "alias h='history' " >> /home/$UNAMEX/.bash_profile
echo "alias python='python3' " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------       Finished Installing Essential Dev Tools     ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
