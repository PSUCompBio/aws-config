#!/bin/bash

date

echo "----Installing vtk----------"
cd /home/$UNAMEX
sudo pip3 install vtk

date

echo "-------Finished installing vtk-----------"


echo "------------Installing pygem-------------"
cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/rbf-brain
git clone https://github.com/mathLab/PyGeM
cp /home/$UNAMEX/rbf-brain/__init__.py /home/$UNAMEX/PyGeM/pygem
cd /home/$UNAMEX/PyGeM
#source /home/$UNAMEX/.bashrc
#/home/$UNAMEX/$CONDAVAR/bin/python2 setup.py install
sudo python3 setup.py install
#/home/$UNAMEX/$CONDAVAR/bin/pip install --upgrade pip
#/home/$UNAMEX/$CONDAVAR/bin/pip install runipy
sudo pip3 install runipy
cd /home/$UNAMEX
echo " -------------------------------------------------------------------"
echo " ----------         Finished Installing PyGem                 ------"
echo " -------------------------------------------------------------------"
date



cp /home/$UNAMEX/rbf-brain/RBFfinal.ipynb /home/$UNAMEX/PyGeM/tutorials/
cp /home/$UNAMEX/rbf-brain/RBFfinal.py /home/$UNAMEX/PyGeM/tutorials/
cp /home/$UNAMEX/rbf-brain/initialmesh.vtk /home/$UNAMEX/PyGeM/tests/test_datasets/
cp /home/$UNAMEX/rbf-brain/parameters_rbf_custom.prm /home/$UNAMEX/PyGeM/tests/test_datasets/
echo " -------------------------------------------------------------------"
echo " ----------               Complete RBF Setup                  ------"
echo " -------------------------------------------------------------------"


echo "Installing imagewrite"
date

git clone https://github.com/PSUCompBio/vtk-image-write
cd vtk-image-write
xvfb-run --server-args="-screen 0 1024x768x24" python3 write-image.py
echo " -------------------------------------------------------------------"
echo " ----------             Complete Image Write Test              ------"
echo " -------------------------------------------------------------------"
date
