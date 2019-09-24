#!/bin/bash
#
cd /home/$UNAMEX
echo "Now in /home/$UNAMEX"
yum install -y wget
#yum install -y mesa-libGL
#yum install -y mesa-libGL-devel
#yum install -y mesa-libGLES
#yum install -y mesa-libGLES-devel
yum install -y xorg-x11-server-Xvfb
# for vtk-src
yum install -y libXt libXt-devel
#yum install -y  mesa-libOSMesa mesa-libOSMesa-devel
#yum install -y mesa-libEGL-devel
yum install -y openmpi openmpi-devel
echo "alias l='ls -ltr' " >> /home/$UNAMEX/.bash_profile
echo "alias h='history' " >> /home/$UNAMEX/.bash_profile
echo "alias python='python3' " >> /home/$UNAMEX/.bash_profile
echo "#LD_LIBRARY_PATH written from inital_setup.sh" >> /home/$UNAMEX/.bash_profile
echo "LD_LIBRARY_PATH=/lib:/lib64:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
echo " " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------       Finished Installing Essential Dev Tools     ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
