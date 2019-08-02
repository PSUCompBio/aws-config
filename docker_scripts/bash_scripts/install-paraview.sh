cd /home/$UNAMEX
git clone https://gitlab.kitware.com/paraview/paraview.git
cd paraview
git submodule update --init --recursive
mkdir build
cd build
cmake ../ -DPARAVIEW_BUILD_QT_GUI=ON
echo " -------------------------------------------------------------------"
echo " ----------       Completed Paraview Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
