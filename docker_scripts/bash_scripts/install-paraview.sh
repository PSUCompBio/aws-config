cd /home/$UNAMEX
git clone https://gitlab.kitware.com/paraview/paraview.git
cd paraview
git submodule update --init --recursive
mkdir build
cd build
cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=ON -DPARAVIEW_BUILD_QT_GUI=OFF
make -j 8
make install 
echo " -------------------------------------------------------------------"
echo " ----------       Completed Paraview Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
