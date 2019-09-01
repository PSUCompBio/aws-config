cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/FemTech
cd FemTech
mkdir build
cd build
cmake .. -DEXAMPLES=ON -DEXAMPLE12=ON -DEXAMPLE7=ON -DEXAMPLE9=ON -DEXAMPLE5=ON
make -j $NCPUS_VAR
echo " -------------------------------------------------------------------"
echo " ----------           Complete FemTech Install                ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
