cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/rbf-brain
git clone https://github.com/PSUCompBio/PyGeM
cp /home/$UNAMEX/rbf-brain/__init__.py /home/$UNAMEX/PyGeM/pygem
cp /home/$UNAMEX/rbf-brain/pass_check.sh /home/$UNAMEX/PyGeM
cd /home/$UNAMEX/PyGeM
#source /home/$UNAMEX/.bashrc
#/home/$UNAMEX/$CONDAVAR/bin/python2 setup.py install
pip3 install --upgrade --force-reinstall setuptools
pip3 install numpy
PYTHONPATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
#mkdir /usr/local/lib/python3.7/
#mkdir /usr/local/lib/python3.7/site-packages
python3 setup.py install
#/home/$UNAMEX/$CONDAVAR/bin/pip install --upgrade pip
#/home/$UNAMEX/$CONDAVAR/bin/pip install runipy
#pip3 install runipy
/bin/bash pass_check.sh
cd /home/$UNAMEX
echo " -------------------------------------------------------------------"
echo " ----------         Finished Installing PyGem                 ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"
