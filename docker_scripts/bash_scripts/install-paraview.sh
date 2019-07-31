cd /home/$UNAMEX
git clone https://gitlab.kitware.com/paraview/paraview.git
git submodule update --init --recursive
mkdir build
cd build
echo " -------------------------------------------------------------------"
echo " ----------       Completed Paraview Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
