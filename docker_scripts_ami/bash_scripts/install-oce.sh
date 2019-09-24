cd /home/$UNAMEX
#git clone https://github.com/tpaviot/oce.git
yum install -y freetype-devel.x86_64
yum install -y fontconfig
yum install -y fontconfig-devel
yum install -y freeglut-devel
git clone https://github.com/PSUCompBio/oce.git
cd oce
mkdir build
cd build
cmake ..
make -j $NCPUS_VAR
make install
echo "#PATH written from inital_oce.sh" >> /home/$UNAMEX/.bash_profile
echo "PATH=\$PATH:/usr/local/bin" >> /home/$UNAMEX/.bash_profile
# note: the variable $LD_LIBRARY_PATH was not being recognized by Docker so
# here RK removed it. Ideally we can figure out ow to use these variables and turn
# back on.
#echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
echo "#LD_LIBRARY_PATH written from inital_oce.sh" >> /home/$UNAMEX/.bash_profile
echo "LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
echo " " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Finished Installing OCE             ------"
echo " -------------------------------------------------------------------"
echo "-----------------OCE END TIME----------------"
date
echo "-----------------------------------"
