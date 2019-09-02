cd /home/$UNAMEX
yum install -y blas lapack blas-devel lapack-devel
git clone https://github.com/PSUCompBio/FemTech
cd FemTech
mkdir build
cd build
 cmake3 .. -DEXAMPLES=ON -DEXAMPLE12=ON -DEXAMPLE7=ON -DEXAMPLE9=ON -DEXAMPLE5=ON \
          -DMPI_CXX_COMPILER=/usr/lib64/openmpi/bin/mpicxx \
          -DMPI_C_COMPILER=/usr/lib64/openmpi/bin/mpicc \
          -DMPIEXEC_EXECUTABLE=/usr/lib64/openmpi/bin/mpirun
make -j $NCPUS_VAR
echo " -------------------------------------------------------------------"
echo " ----------           Complete FemTech Install                ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
