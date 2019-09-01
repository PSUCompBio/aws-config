cd /home/$UNAMEX
#git clone https://github.com/tpaviot/oce.git
yum install -y freetype-devel.x86_64
yum install -y fontconfig
yum install -y fontconfig-devel
yum install -y freeglut-devel
git clone https://github.com/PSUCompBio/oce.git
echo "-------------OCE CLONE FINISH TIME--------------------"
date
echo "-----------------------------------"
cd oce
mkdir build
cd build
echo "------------python oce make start---------------------"
date
echo "-----------------------------------"
cmake ..
make -j $NCPUS_VAR
make install
echo "-------------python oce make end--------------------"
date
echo "-----------------------------------"
echo "PATH=\$PATH:/usr/local/bin" >> /home/$UNAMEX/.bash_profile
echo "export PATH" >> /home/$UNAMEX/.bash_profile
# note: the variable $LD_LIBRARY_PATH was not being recognized by Docker so
# here RK removed it. Ideally we can figure out ow to use these variables and turn
# back on.
#echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Finished Installing OCE             ------"
echo " -------------------------------------------------------------------"
echo "-----------------OCE END TIME----------------"
date
echo "-----------------------------------"
