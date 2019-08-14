cd /home/$UNAMEX
wget https://prdownloads.sourceforge.net/tcl/tcl8.6.9-src.tar.gz
gunzip tcl8.6.9-src.tar.gz
tar -xvf tcl8.6.9-src.tar
rm tcl8.6.9-src.tar
cd tcl8.6.9/unix
./configure
make -j 8
make test
make install
echo " -------------------------------------------------------------------"
echo " ----------           Complete TCL Install                ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
