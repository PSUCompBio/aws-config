cd /home/$UNAMEX
git clone https://code.qt.io/qt/qt5.git
cd qt5
git checkout 5.12
perl init-repository --module-subset=default,-qtwebengine
mkdir build
cd build
export LLVM_INSTALL_DIR=/usr/bin/llvm-config
 ../configure -developer-build -opensource -nomake examples -nomake tests -skip qtwebengine -confirm-license
 make -j 8
 echo " -------------------------------------------------------------------"
 echo " ----------       Completed qt5 Install          ------"
 echo " -------------------------------------------------------------------"

 echo "---------------------------------"
 date
 echo "-----------------------------------"
