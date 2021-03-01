source /home/$UNAMEX/.bash_profile
cd /home/$UNAMEX
echo $VTK_ROOT
git clone https://github.com/PSUCompBio/MergePolyData
cd MergePolyData
mkdir build
cd build
cmake .. -DVTK_DIR=$VTK_ROOT/build
make -j 8
xvfb-run ./ImageCapture examples/ply-to-png/model.ply  examples/ply-to-png/model.jpg examples/ply-to-png/test.png
cd /home/$UNAMEX/MergePolyData
/bin/bash pass_check.sh
echo " -------------------------------------------------------------------"
echo " ----------       Completed MergePolyData Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
