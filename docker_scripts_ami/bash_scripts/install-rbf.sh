source /home/$UNAMEX/.bash_profile
cd /home/$UNAMEX
#git clone -b rbfchanges https://github.com/PSUCompBio/rbf-brain
git clone  https://github.com/PSUCompBio/rbf-brain
cd rbf-brain
# # makes a stl
pvpython extract.py  --input model.ply --output model.stl

# # makes a parameters fle
pvpython controlpoints.py --input model.stl --output parameters.prm

# # to genterate VTK file that is the morphed mesh
python3 RBF_coarse.py --p parameters.prm --m coarse_brain.vtk --output coarse_brain_morphed.vtk


# this adds meshio library to python3 that converts the legacy
# vtu file to XML based vtu file.
pip3 install meshio
meshio-convert coarse_brain_morphed.vtk converted_output.vtu
meshio-ascii converted_output.vtu

## OLD  - uses legacy vtk format  (not XML)
# # convert to abaqus version 1
#~/MergePolyData/build/MergePolyData -in coarse_mesh_morphed.vtk -out coarse_mesh_morphed.inp -abaqus

# # convert to abaqus version 2
~/MergePolyData/build/InpFromVTK -in converted_output.vtk -out coarse_mesh_morphed-v2.inp -abaqus

# make elemental centroid lookup table, needs to be stored per person.
#pvpython lookuptablegenerator_coarse.py

# # For the brain that we download from the website
pvpython meshrotate.py --input coarse_brain_morphed.vtk --output coarse_brain_morphed_rotated.vtk

# # for creating skull and brain surface files for displaying on the website
#pvpython extract_surface.py --input coarse_brain_morphed_rotated.vtk --outputskull skull.ply --outputbrain brain.ply

# there are some additional files for transforming the head model.ply so that it is
# in line with face model.ply but this was not implemented successfully yet
# so have not included ths commands for this

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
