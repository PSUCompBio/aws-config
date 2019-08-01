cd /home/$UNAMEX
git clone https://code.qt.io/qt/qt5.git
cd qt5
git checkout 5.12
perl init-repository --module-subset=default, qtx11extras
mkdir build
cd build
export LLVM_INSTALL_DIR=/usr/bin/llvm-config
 ../configure -developer-build -opensource -nomake examples -nomake tests -skip qtwebengine -confirm-license
 make -j 8
 make install
 echo " -------------------------------------------------------------------"
 echo " ----------       Completed qt5 Install          ------"
 echo " -------------------------------------------------------------------"

 echo "---------------------------------"
 date
 echo "-----------------------------------"
