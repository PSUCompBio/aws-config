source /home/$UNAMEX/.bash_profile
cd /home/$UNAMEX
echo $VTK_ROOT
git clone https://github.com/PSUCompBio/MergePolyData
cd MergePolyData
mkdir build
cd build
cmake .. -DVTK_DIR=$VTK_ROOT/build
make -j $NCPUS_VAR
echo " -------------------------------------------------------------------"
echo " ----------       Completed MergePolyData Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
