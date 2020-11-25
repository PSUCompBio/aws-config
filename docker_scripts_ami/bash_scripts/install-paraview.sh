cd /home/$UNAMEX
#git clone https://gitlab.kitware.com/paraview/paraview.git
#wget -O ParaView-5.7.0-RC4-osmesa-MPI-Linux-Python3.7-64bit.tar.gz "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.7&type=binary&os=Linux&downloadFile=ParaView-5.7.0-RC4-osmesa-MPI-Linux-Python3.7-64bit.tar.gz"
#
# below  file ID is stored on PSU comp bio google drive
#export fileid=1J3VM9sIwSWn95kl2L8mlNpPHyGd9Js28
#export filename=ParaView-5.7.0-RC4-osmesa-MPI-Linux-Python3.7-64bit.tar.gz
#wget --save-cookies cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid -O-  | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > confirm.txt
#wget --load-cookies cookies.txt -O $filename 'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(<confirm.txt)
#PARAVIEW_VERSION=ParaView-5.7.0-RC4-osmesa-MPI-Linux-Python3.7-64bit
PARAVIEW_VERSION=ParaView-5.8.1-osmesa-MPI-Linux-Python3.7-64bit
echo $PARAVIEW_VERSION
wget --no-check-certificate --no-proxy https://paraview-nsfcareer.s3.amazonaws.com/$PARAVIEW_VERSION.tar.gz
gunzip $PARAVIEW_VERSION.tar.gz
tar -xvf $PARAVIEW_VERSION.tar
rm $PARAVIEW_VERSION.tar
#mv $PARAVIEW_VERSION Paraview
#---------------------------------------------------
#------------------install zlib ---------------------
#----------------------------------------------------
cd /home/$UNAMEX
wget --no-check-certificate --no-proxy https://paraview-nsfcareer.s3.amazonaws.com/zlib-1.2.9.tar.gz
gunzip zlib-1.2.9.tar.gz
tar -xvf zlib-1.2.9.tar
cd zlib-1.2.9
./configure
make
#export LD_LIBRARY_PATH=/home/ec2-user/zlib-1.2.9:$LD_LIBRARY_PATH
#cd paraview
#git submodule update --init --recursive
#mkdir build
#cd build
echo "#LD_LIBRARY_PATH written from install-paraview.sh" >> /home/$UNAMEX/.bash_profile
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/home/$UNAMEX/zlib-1.2.9:/home/$UNAMEX/$PARAVIEW_VERSION/lib" >> /home/$UNAMEX/.bash_profile
#PATH=$PATH:/home/$UNAMEX/Paraview-5.7.0/bin
echo "#PATH written from install-paraview.sh" >> /home/$UNAMEX/.bash_profile
echo "export PATH=\$PATH:/home/$UNAMEX/$PARAVIEW_VERSION/bin" >> /home/$UNAMEX/.bash_profile
echo " " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
#cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=ON -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-lglut -lGLU"
#cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=ON -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-L/usr/lib/x86_64-linux-gnu/libGL.so  -L/usr/lib/x86_64-linux-gnu/libGLU.so-L/usr/lib/x86_64-linux-gnu/libOSMesa.so"
#cmake ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_USE_X=OFF -DVTK_OPENGL_HAS_OSMESA=ON -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-L/usr/lib/x86_64-linux-gnu/libGL.so  -L/usr/lib/x86_64-linux-gnu/libGLU.so-L/usr/lib/x86_64-linux-gnu/libOSMesa.so" -DVTK_USE_X=ON
#cmake3 ../ -DCMAKE_BUILD_TYPE=Release -DPARAVIEW_ENABLE_PYTHON=ON -DVTK_OPENGL_HAS_OSMESA=OFF -DPARAVIEW_BUILD_QT_GUI=OFF -DCMAKE_CXX_FLAGS="-L/usr/lib64/libGL.so  -L/usr/lib64/libGLU.so" -DVTK_USE_X=ON -DOPENGL_INCLUDE_DIR=/usr/include/GL -DOPENGL_GLES2_INCLUDE_DIR=/usr/include/GLES2 -DOPENGL_GLES3_INCLUDE_DIR=/usr/include/GLES3 -DOPENGL_EGL_INCLUDE_DIR=/usr/include/EGL -DOSMESA_INCLUDE_DIR=/usr/include/GL -DOPENGL_GLX_INCLUDE_DIR=/usr/include/GL
#make -j $NCPUS_VAR
#make install
echo " -------------------------------------------------------------------"
echo " ----------       Completed Paraview Install          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"
