cd /home/$UNAMEX
yum install pcre.x86_64 pcre-static.x86_64  pcre-devel.x86_64 -y
yum install bison -y 
git clone https://github.com/swig/swig.git
cd swig
./autogen.sh
./configure
make -j8
make install
echo " -------------------------------------------------------------------"
echo " ----------              Finished Installing Swig             ------"
echo " -------------------------------------------------------------------"
echo "------------SWIG END TIME---------------------"
date
echo "-----------------------------------"
