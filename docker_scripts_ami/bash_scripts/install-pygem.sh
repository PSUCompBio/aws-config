cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/PyGeM
cd /home/$UNAMEX/PyGeM
#source /home/$UNAMEX/.bashrc
#/home/$UNAMEX/$CONDAVAR/bin/python2 setup.py install
pip3 install --upgrade --force-reinstall setuptools
pip3 install numpy
pip3 install pyparsing
pip3 install cycler
pip3 install python-dateutil
pip3 install kiwisolver
pip3 install wheel
pip3 install requests in line
PYTHONPATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
#mkdir /usr/local/lib/python3.7/
#mkdir /usr/local/lib/python3.7/site-packages
python3 setup.py install
#/home/$UNAMEX/$CONDAVAR/bin/pip install --upgrade pip
#/home/$UNAMEX/$CONDAVAR/bin/pip install runipy
#pip3 install runipy
cd /home/$UNAMEX/PyGeM/tutorials
python3 RBFfinal.py
cd /home/$UNAMEX/PyGeM
/bin/bash pass_check.sh
cd /home/$UNAMEX
echo " -------------------------------------------------------------------"
echo " ----------         Finished Installing PyGem                 ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"
