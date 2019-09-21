source /home/$UNAMEX/.bash_profile
cd /home/$UNAMEX
echo $VTK_ROOT
git clone https://github.com/PSUCompBio/ProjectedTexture-VTK
cd ProjectedTexture-VTK
mkdir build
cd build
cmake3 .. -DVTK_DIR=$VTK_ROOT/build
make -j $NCPUS_VAR
xvfb-run ./ProjectedTexture ../model.ply ../model.jpg  test.png
cd /home/$UNAMEX/ProjectedTexture-VTK
bin/bash pass_check.sh
echo " -------------------------------------------------------------------"
echo " ----------       Completed ProjectedTexture Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
