source /home/$UNAMEX/.bash_profile
cd /home/$UNAMEX
echo $VTK_ROOT
git clone https://github.com/PSUCompBio/MergePolyData
cd MergePolyData
mkdir build
cd build
cmake3 .. -DVTK_DIR=$VTK_ROOT/build -DCMAKE_CXX_FLAGS=-I/usr/local/include/vtk-8.2
make -j $NCPUS_VAR
xvfb-run -a --server-args="-screen 0 1024x768x24" ./ImageCapture examples/ply-to-png/model.ply  examples/ply-to-png/model.jpg examples/ply-to-png/test.png
cd /home/$UNAMEX/MergePolyData
/bin/bash pass_check.sh
echo " -------------------------------------------------------------------"
echo " ----------       Completed MergePolyData Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
