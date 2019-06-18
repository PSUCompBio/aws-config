#!/bin/bash
#
# Set instance type
#INSTANCE="ami"
INSTANCE="ubuntu"
WEBSITENAME="web"
#
#

echo "SCRIPT START TIME"
date

echo " -------------------------------------------------------------------"
echo " ----------                Instance Type                      ------"
echo " -------------------------------------------------------------------"
echo $INSTANCE
echo " -------------------------------------------------------------------"
echo " -------------------------------------------------------------------"
if [ "$INSTANCE" == "ami" ]; then
        UNAMEX="ec2-user"
elif [ "$INSTANCE" == "ubuntu" ]; then
        UNAMEX="ubuntu"
        HOME="/home/ubuntu"
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
        apt-get update -y
else
        echo "Instance Type does not exist in config_bash script - please update it."
fi
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

cd /home/$UNAMEX
git clone https://github.com/swig/swig.git


cd /home/$UNAMEX
git clone https://github.com/tpaviot/oce.git
echo "-------------OCE CLONE FINISH TIME--------------------"
date
echo "-----------------------------------"



echo "PATH=$PATH:/usr/local/bin" >> /home/$UNAMEX/.bash_profile
echo "export PATH" >> /home/$UNAMEX/.bash_profile
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Finished Installing OCE             ------"
echo " -------------------------------------------------------------------"
echo "-----------------OCE END TIME----------------"
date
echo "-----------------------------------"



cd /home/$UNAMEX
sleep 20
git clone https://github.com/PSUCompBio/pythonocc-core.git
if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
        git clone git://github.com/PSUCompBio/pythonocc-core
fi



cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/rbf-brain
git clone https://github.com/mathLab/PyGeM
cp /home/$UNAMEX/rbf-brain/__init__.py /home/$UNAMEX/PyGeM/pygem
cd /home/$UNAMEX/PyGeM
#source /home/$UNAMEX/.bashrc
#/home/$UNAMEX/$CONDAVAR/bin/python2 setup.py install

cd /home/$UNAMEX
echo " -------------------------------------------------------------------"
echo " ----------         Finished Installing PyGem                 ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"



cp /home/$UNAMEX/rbf-brain/RBFfinal.ipynb /home/$UNAMEX/PyGeM/tutorials/
cp /home/$UNAMEX/rbf-brain/RBFfinal.py /home/$UNAMEX/PyGeM/tutorials/
cp /home/$UNAMEX/rbf-brain/initialmesh.vtk /home/$UNAMEX/PyGeM/tests/test_datasets/
cp /home/$UNAMEX/rbf-brain/parameters_rbf_custom.prm /home/$UNAMEX/PyGeM/tests/test_datasets/

git clone https://github.com/PSUCompBio/vtk-image-write

cd /home/$UNAMEX
git clone https://github.com/Kitware/VTK
export VTK_ROOT=/home/$UNAMEX/VTK
cd $VTK_ROOT


cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/FemTech
cd FemTech


cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/MergePolyData
cd MergePolyData
mkdir build
cd build

cd /home/$UNAMEX
chown -R $UNAMEX *
echo " -------------------------------------------------------------------"
echo " ----------            Complete Assigning Permissions         ------"
echo " -------------------------------------------------------------------"
echo "Initiation script complete! See /var/log/cloud-init-output.log for install log." >> InstallComplete
chown -R $UNAMEX InstallComplete
