cd /home/$UNAMEX
wget -q ftp://ftp.freedesktop.org/pub/mesa/older-versions/11.x/11.0.0/mesa-11.0.0-rc1.tar.gz
wget -q ftp://ftp.freedesktop.org/pub/mesa/glu/glu-9.0.0.tar.gz
gunzip mesa-11.0.0-rc1.tar.gz
tar -xvf mesa-11.0.0-rc1.tar
cd mesa-11.0.0-rc1
./configure CXXFLAGS="-fPIC -O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31" CFLAGS="-fPIC -O2 -g -DDEFAULT_SOFTWARE_DEPTH_BITS=31" LDFLAGS="-lm -lstdc++"      --disable-xvmc --disable-glx --disable-dri --enable-opengl --disable-gles1 --disable-gles2 --disable-egl --with-dri-drivers="" --with-gallium-drivers="swrast"      --enable-texture-float --enable-shared-glapi --enable-gallium-osmesa --enable-gallium-llvm=yes --prefix=/opt/osmesa_llvmpipe PYTHON2=/usr/bin/python3
make -j $NCPUS_VAR
make install
cd /home/$UNAMEX
gunzip glu-9.0.0.tar.gz
tar -xvf glu-9.0.0.tar
cd glu-9.0.0
./configure PKG_CONFIG_PATH=/opt/osmesa_llvmpipe/lib/pkgconfig  CXXFLAGS="-fPIC -O2"  CFLAGS="-fPIC -O2"   LDFLAGS="-lm -lstdc++"   --enable-osmesa     --prefix=/opt/osmesa_llvmpipe
make -j $NCPUS_VAR
make install


#wget -q http://www.vtk.org/files/release/5.8/vtk-5.8.0.tar.gz
