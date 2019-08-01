cd /home/$UNAMEX
git clone https://gitlab.kitware.com/paraview/paraview.git
cd paraview
git submodule update --init --recursive
mkdir build
cd build
 cmake ../  -DQt5_DIR=/home/ubuntu/qt5/build/qtbase/lib/cmake/Qt5 -DQt5X11Extras_DIR=/home/ubuntu/qt5/build
echo " -------------------------------------------------------------------"
echo " ----------       Completed Paraview Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
