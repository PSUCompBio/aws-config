#!/bin/bash

date

echo "-----------Installing swig------------"
cd /home/$UNAMEX
git clone https://github.com/swig/swig.git
cd swig
./autogen.sh
./configure
make -j8
sudo make install
echo " -------------------------------------------------------------------"
echo " ----------              Finished Installing Swig             ------"
echo " -------------------------------------------------------------------"

date

