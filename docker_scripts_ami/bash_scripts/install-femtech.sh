cd /home/$UNAMEX
yum install -y blas lapack blas-devel lapack-devel
git clone -b develop https://github.com/PSUCompBio/FemTech
cd FemTech
mkdir build
cd build
cmake3 .. -DEXAMPLES=ON -DEXAMPLE5=ON -DEXAMPLE9=ON \
          -DMPI_CXX_COMPILER=/usr/lib64/openmpi/bin/mpicxx \
          -DMPI_C_COMPILER=/usr/lib64/openmpi/bin/mpicc \
          -DMPIEXEC_EXECUTABLE=/usr/lib64/openmpi/bin/mpirun
make -j $NCPUS_VAR
echo "#PATH written from install_femtech.sh" >> /home/$UNAMEX/.bash_profile
echo "PATH=\$PATH:/usr/lib64/openmpi/bin" >> /home/$UNAMEX/.bash_profile
echo " " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
cd examples/ex9
mpirun --allow-run-as-root -np 1  --mca btl_base_warn_component_unused 0  -mca btl_vader_single_copy_mechanism none ex9 1-elt-cube.k
git clone https://github.com/PSUCompBio/femtech-aws-pass-check
cp femtech-aws-pass-check/pass_check.sh .
/bin/bash pass_check.sh
echo " -------------------------------------------------------------------"
echo " ----------           Complete FemTech Install                ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
