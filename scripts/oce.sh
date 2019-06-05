#!/bin/bash

echo "------Installing oce----------"
date

cd /home/$UNAMEX
git clone https://github.com/tpaviot/oce.git
cd oce
mkdir build
cd build
cmake ..
make -j4
sudo make install
echo "PATH=$PATH:/usr/local/bin" >> /home/$UNAMEX/.bash_profile
echo "export PATH" >> /home/$UNAMEX/.bash_profile
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Finished Installing OCE             ------"
echo " -------------------------------------------------------------------"
date
