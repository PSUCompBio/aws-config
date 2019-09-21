cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/vtk-image-write
cd vtk-image-write
xvfb-run --server-args="-screen 0 1024x768x24" python3 write-image.py
bin/bash pass_check.sh
echo " -------------------------------------------------------------------"
echo " ----------             Complete Image Write Test              ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
