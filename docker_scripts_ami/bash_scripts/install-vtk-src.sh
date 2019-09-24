cd /home/$UNAMEX
git clone https://github.com/Kitware/VTK
#wget https://gitlab.kitware.com/vtk/vtk/-/archive/v8.2.0/vtk-v8.2.0.tar.gz
#wget https://gitlab.kitware.com/vtk/vtk/-/archive/v5.10.1/vtk-v5.10.1.tar.gz
#wget https://gitlab.kitware.com/vtk/vtk/-/archive/v6.3.0/vtk-v6.3.0.tar.gz
wget https://gitlab.kitware.com/vtk/vtk/-/archive/v5.10.0/vtk-v5.10.0.tar.gz
gunzip vtk-v5.10.0
tar -xvf vtk-v5.10.0.tar
rm vtk-v5.10.0.tar
export VTK_ROOT=/home/$UNAMEX/vtk-v5.10.0
cd $VTK_ROOT
mkdir build
cd build
yum install -y mesa-libGL
yum install -y mesa-libGL-devel
yum install -y mesa-libGLES
yum install -y mesa-libGLES-devel
yum install -y  mesa-libOSMesa mesa-libOSMesa-devel
yum install -y mesa-libEGL-devel
yum install python2-devel -y
#cmake3 .. -DVTK_PYTHON_VERSION=3 -DPYTHON_EXECUTABLE="/usr/bin/python3"
#cmake3 .. -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release  -DVTK_OPENGL_HAS_EGL=OFF  -DVTK_OPENGL_HAS_OSMESA=OFF -DVTK_OPENGL_USE_GLES=OFF -DVTK_USE_X=OFF  -DVTK_WRAP_PYTHON=ON  -DBUILD_EXAMPLES=OFF -DVTK_PYTHON_VERSION=3 -DPYTHON_EXECUTABLE="/usr/bin/python3" -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -DCMAKE_CXX_FLAGS="-lGLU -lGL" -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")  -DPYTHON_LIBRARY=$(python3 -c "import distutils.sysconfig as sysconfig; print(sysconfig.get_config_var('LIBDIR'))")
# same as above but put on new lines.
cmake3 .. -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release  \
           -DVTK_OPENGL_HAS_EGL=OFF  -DVTK_OPENGL_HAS_OSMESA=OFF \
           -DVTK_OPENGL_USE_GLES=OFF -DVTK_USE_X=OFF  -DVTK_WRAP_PYTHON=ON \
            -DBUILD_EXAMPLES=OFF -DVTK_PYTHON_VERSION=2 \
            -DPYTHON_EXECUTABLE="/usr/bin/python2" -DBUILD_EXAMPLES=OFF \
            -DBUILD_TESTING=OFF -DCMAKE_CXX_FLAGS="-lGLU -lGL" \
            -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
            -DPYTHON_LIBRARY=/usr/lib64/libpython.2.7.so

#MESA_INSTALL_PREFIX=/opt/osmesa_llvmpipe
#cmake3     -DBUILD_SHARED_LIBS=ON     -DVTK_WRAP_PYTHON=ON     -DVTK_USE_X=OFF     -DVTK_USE_SYSTEM_HDF5=ON        -DOPENGL_INCLUDE_DIR=${MESA_INSTALL_PREFIX}/include     -DOPENGL_gl_LIBRARY=${MESA_INSTALL_PREFIX}/lib/libGLU.so     -DOPENGL_glu_LIBRARY=${MESA_INSTALL_PREFIX}/lib/libglapi.so     -DVTK_OPENGL_HAS_OSMESA=ON     -DOSMESA_INCLUDE_DIR=${MESA_INSTALL_PREFIX}/include     -DOSMESA_LIBRARY=${MESA_INSTALL_PREFIX}/lib/libOSMesa.so ..
#ccmake3 ../ -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DVTK_OPENGL_HAS_EGL=ON -DVTK_OPENGL_HAS_OSMESA=ON -DVTK_OPENGL_USE_GLES=ON -DVTK_WRAP_PYTHON=ON -DBUILD_EXAMPLES=OFF -DVTK_PYTHON_VERSION=3 -DPYTHON_EXECUTABLE="/usr/bin/python3" -DOSMESA_LIBRARY="/opt/osmesa_llvmpipe/lib/libOSMesa.so"
make -j $NCPUS_VAR
make install
cd /home/$UNAMEX
echo "#VTK_ROOT written from inital-vtk-src.sh" >> /home/$UNAMEX/.bash_profile
echo "VTK_ROOT=/home/$UNAMEX/vtk-v5.10.0" >> /home/$UNAMEX/.bash_profile
echo "#LD_LIBRARY_PATH written from inital-vtk-src.sh" >> /home/$UNAMEX/.bash_profile
echo "LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$VTK_ROOT/build/bin:\$VTK_ROOT/build/lib" >> /home/$UNAMEX/.bash_profile
echo " " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Complete VTK Install                ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"
