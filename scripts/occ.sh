#!/bin/bash

echo "Installing oce"

date

cd /home/$UNAMEX

git clone https://github.com/PSUCompBio/pythonocc-core.git
if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
        git clone git://github.com/PSUCompBio/pythonocc-core
fi
cd pythonocc-core
mkdir build
cd build
cmake .. -DPYTHONOCC_INSTALL_DIRECTORY:PATH=/usr/lib/python3.6/dist-packages/OCC
make -j4
sudo make install
echo " -------------------------------------------------------------------"
echo " ----------      Finished Installing Python OCC Core          ------"
echo " -------------------------------------------------------------------"
date
