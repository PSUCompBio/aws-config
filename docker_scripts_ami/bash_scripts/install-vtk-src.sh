cd /home/$UNAMEX
git clone https://github.com/Kitware/VTK
export VTK_ROOT=/home/$UNAMEX/VTK
cd $VTK_ROOT
mkdir build
cd build
# cmake3 ../ -DBUILD_SHARED_LIBS=ON \
#             -DCMAKE_BUILD_TYPE=Release \
#             -DVTK_OPENGL_HAS_EGL=OFF
#             -DVTK_OPENGL_HAS_OSMESA=ON \
#             -DVTK_OPENGL_USE_GLES=OFF \
#             -DVTK_USE_X=OFF \
#             -DVTK_WRAP_PYTHON=ON \
#             -DBUILD_EXAMPLES=OFF \
#             -DVTK_PYTHON_VERSION=3 \
#             -DPYTHON_EXECUTABLE="/usr/bin/python3"
MESA_INSTALL_PREFIX=/opt/osmesa_llvmpipe
yum install python2-devel -y
cmake3     -DBUILD_SHARED_LIBS=ON     -DVTK_WRAP_PYTHON=ON     -DVTK_USE_X=OFF     -DVTK_USE_SYSTEM_HDF5=ON        -DOPENGL_INCLUDE_DIR=${MESA_INSTALL_PREFIX}/include     -DOPENGL_gl_LIBRARY=${MESA_INSTALL_PREFIX}/lib/libGLU.so     -DOPENGL_glu_LIBRARY=${MESA_INSTALL_PREFIX}/lib/libglapi.so     -DVTK_OPENGL_HAS_OSMESA=ON     -DOSMESA_INCLUDE_DIR=${MESA_INSTALL_PREFIX}/include     -DOSMESA_LIBRARY=${MESA_INSTALL_PREFIX}/lib/libOSMesa.so ..
#ccmake3 ../ -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DVTK_OPENGL_HAS_EGL=ON -DVTK_OPENGL_HAS_OSMESA=ON -DVTK_OPENGL_USE_GLES=ON -DVTK_WRAP_PYTHON=ON -DBUILD_EXAMPLES=OFF -DVTK_PYTHON_VERSION=3 -DPYTHON_EXECUTABLE="/usr/bin/python3" -DOSMESA_LIBRARY="/opt/osmesa_llvmpipe/lib/libOSMesa.so"
make -j $NCPUS_VAR
make install
cd /home/$UNAMEX
echo "export LD_LIBRARY_PATH=$VTK_ROOT/build/bin:$VTK_ROOT/build/lib:$LD_LIBRARY_PATH" >> /home/$UNAMEX/.bash_profile
echo "VTK_ROOT=/home/$UNAMEX/VTK" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Complete VTK Install                ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"
