cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/pythonocc-core.git
cd pythonocc-core
echo "-------------python occ build start--------------------"
date
echo "-----------------------------------"
mkdir build
cd build
echo "-------python occ cmake start-------------------------"
date
echo "-----------------------------------"
#cmake .. -DPYTHONOCC_INSTALL_DIRECTORY:PATH=/usr/lib/python3.6/dist-packages/OCC
cmake ../ -DPYTHON_EXECUTABLE=/usr/bin/python3  -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")   -DPYTHON_LIBRARY=$(python3 -c "import distutils.sysconfig as sysconfig; import os; print(os.path.join(sysconfig.get_config_var('LIBDIR'), sysconfig.get_config_var('LDLIBRARY')))")
make -j $NCPUS_VAR
echo "-------------python occ make install start--------------------"
date
echo "-----------------------------------"
make install
echo " -------------------------------------------------------------------"
echo " ----------      Finished Installing Python OCC Core          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
