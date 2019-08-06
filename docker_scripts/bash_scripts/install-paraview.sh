cd /home/$UNAMEX
git clone https://gitlab.kitware.com/paraview/paraview.git
cd paraview
git submodule update --init --recursive
mkdir build
cd build
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu
#cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=ON -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-lglut -lGLU"
#cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=ON -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-L/usr/lib/x86_64-linux-gnu/libGL.so  -L/usr/lib/x86_64-linux-gnu/libGLU.so-L/usr/lib/x86_64-linux-gnu/libOSMesa.so"
#cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=ON -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-L/usr/lib/x86_64-linux-gnu/libGL.so  -L/usr/lib/x86_64-linux-gnu/libGLU.so-L/usr/lib/x86_64-linux-gnu/libOSMesa.so" -DVTK_USE_X=ON
cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=OFF -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-L/usr/lib/x86_64-linux-gnu/libGL.so  -L/usr/lib/x86_64-linux-gnu/libGLU.so-L/usr/lib/x86_64-linux-gnu/libOSMesa.so" -DVTK_USE_X=ON -DOPENGL_INCLUDE_DIR=/usr/include/GL -DOPENGL_GLES2_INCLUDE_DIR=/usr/include/GLES2 -DOPENGL_GLES3_INCLUDE_DIR=/usr/include/GLES3 -DOPENGL_EGL_INCLUDE_DIR=/usr/include/EGL -DOSMESA_INCLUDE_DIR=/usr/include/GL -DOPENGL_GLX_INCLUDE_DIR=/usr/include/GL
#make -j 8
#make install
echo " -------------------------------------------------------------------"
echo " ----------       Completed Paraview Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
