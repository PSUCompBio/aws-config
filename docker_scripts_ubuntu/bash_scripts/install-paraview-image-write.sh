cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/paraview-image-write
cd paraview-image-write
xvfb-run -a --server-args="-screen 0 1024x768x24" pvpython ppr1.py
echo " -------------------------------------------------------------------"
echo " ----------    Complete Paraview Image Write Test             ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"
