#!/bin/bash
#
cd /home/$UNAMEX
echo "Now in /home/$UNAMEX"
yum install -y wget
yum install -y xorg-x11-server-Xvfb
# for vtk-src
yum install -y libXt libXt-devel
yum install -y openmpi openmpi-devel
# for vimrc style
git clone https://gist.github.com/simonista/8703722
cp 8703722/.vimrc .
rm -rf 8703722
echo "alias l='ls -ltr' " >> /home/$UNAMEX/.bash_profile
echo "alias h='history' " >> /home/$UNAMEX/.bash_profile
echo "alias vi='vim' " >> /home/$UNAMEX/.bash_profile
echo "alias python='python3' " >> /home/$UNAMEX/.bash_profile
echo " " >> /home/$UNAMEX/.bash_profile
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
