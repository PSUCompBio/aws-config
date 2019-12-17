cd /home/$UNAMEX
git clone -b rbfchanges https://github.com/PSUCompBio/rbf-brain
cd rbf-brain
# # makes a stl
pvpython extract.py

# # makes a parameters fle
pvpython controlpoints.py

# # to genterate VTK file that is the morphed mesh
python3  RBF_coarse.py

# # convert to abaqus
~/MergePolyData/build/MergePolyData -in coarse_mesh_morphed.vtk -out coarse_mesh_morphed.inp -abaqus

# make elemental centroid lookup table, needs to be stored per person.
pvpython lookuptablegenerator_coarse.py

/bin/bash pass_check.sh
#
#cp /home/$UNAMEX/rbf-brain/RBFfinal.ipynb /home/$UNAMEX/PyGeM/tutorials/
#cp /home/$UNAMEX/rbf-brain/RBFfinal.py /home/$UNAMEX/PyGeM/tutorials/
#cp /home/$UNAMEX/rbf-brain/Merged.vtk /home/$UNAMEX/PyGeM/tests/test_datasets/
#cp /home/$UNAMEX/rbf-brain/parameters_rbf_custom.prm /home/$UNAMEX/PyGeM/tests/test_datasets/
#cd /home/$UNAMEX/PyGeM/tutorials
#source /home/$UNAMEX/.bash_profile
#python3 RBFfinal.py
echo " -------------------------------------------------------------------"
echo " ----------               Complete RBF Setup                  ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"


# cd tutorials
# mv  ../../rbf-brain/*.py .
# mv  ../../rbf-brain/*.ipynb .
# mv  ../../rbf-brain/centroid_*.txt .
# mv  ../../rbf-brain/model.ply .
#
# cd tests/test_datasets/
# mv  ../../../rbf-brain/*.prm .
# mv  ../../../rbf-brain/*.vtk .
#
# cd tutorials
# # makes a stl
# pvpython extract.py
# # makes a parameters fle
# pvpython controlpoints.py
# mv parameters.prm ../tests/test_datasets/
# # to genterate VTK file that is the morphed mesh
# python3  RBF_coarse.py
# # convert to abaqus
 # ~/MergePolyData/build/MergePolyData -in coarse_mesh_morphed.vtk -out coarse_mesh_morphed.inp -abaqus
# make elemental centroid lookup table, needs to be stored per person.
#  pvpython lookuptablegenerator_coarse.py
#
