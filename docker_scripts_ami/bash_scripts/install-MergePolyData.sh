source /home/$UNAMEX/.bash_profile
cd /home/$UNAMEX
echo $VTK_ROOT
#git clone -b Amazon-AMI https://github.com/PSUCompBio/MergePolyData
git clone https://github.com/PSUCompBio/MergePolyData
cd MergePolyData
mkdir build
cd build
cmake3 .. -DVTK_DIR=$VTK_ROOT/build -DCMAKE_CXX_FLAGS=-I/usr/local/include/vtk-7.1
make -j $NCPUS_VAR
./MergePolyData -in examples/4-Simple-Parts/part1.ply.vtk examples/4-Simple-Parts/part2.ply.vtk examples/4-Simple-Parts/part3.ply.vtk examples/4-Simple-Parts/part4.ply.vtk -out examples/4-Simple-Parts/combined.vtk -abaqus
./Quad2Hex -in examples/convert-Quad2Hex/chank.ply -out examples/convert-Quad2Hex/chank_Hex.vtk
xvfb-run -a --server-args="-screen 0 1024x768x24" ./ImageCapture examples/ply-to-png/model.ply  examples/ply-to-png/model.jpg examples/ply-to-png/test.png
xvfb-run -a --server-args="-screen 0 1024x768x24" ./MultipleViewPorts examples/multipleViewPorts/brain3.ply  examples/multipleViewPorts/Br_color3.jpg examples/multipleViewPorts/test_output.json examples/multipleViewPorts/test.png examples/multipleViewPorts/cellcentres.txt
cd /home/$UNAMEX/MergePolyData
/bin/bash pass_check.sh
echo " -------------------------------------------------------------------"
echo " ----------       Completed MergePolyData Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
