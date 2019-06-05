FROM ubuntu

ENV UNAMEX=root
ENV WEBSITENAME=web

RUN apt-get update
RUN apt-get install -y vim

#Install git
RUN apt-get install -y git apt-utils

RUN apt-get install -y libgl1 libxt6 build-essential cmake-curses-gui xvfb nodejs npm 

RUN npm i -g npx

RUN apt-get install -y freeglut3-dev libblas-dev liblapack-dev openmpi-bin openmpi-common libopenmpi-dev python3-pip autotools-dev automake libpcre3-dev bison byacc libfreetype6-dev pkg-config libfontconfig1-dev mdm 

RUN pip3 install numpy matplotlib

RUN echo "alias l='ls -ltr' " >> /home/$UNAMEX/.bash_profile
RUN echo "alias h='history' " >> /home/$UNAMEX/.bash_profile
RUN echo "alias python='python3' " >> /home/$UNAMEX/.bash_profile
RUN source /home/$UNAMEX/.bash_profile

CMD ["echo","Finished installing dev tools"]

RUN cd /home/$UNAMEX
RUN git clone https://github.com/swig/swig.git
RUN cd swig
RUN ./autogen.sh
RUN ./configure
RUN make -j8
RUN make install


CMD ["echo","Finished Installing SWIG"]

RUN cd /home/$UNAMEX

RUN git clone https://github.com/tpaviot/oce.git
RUN cd oce
RUN mkdir build
RUN cd build
RUN cmake ..
RUN make -j2 
RUN make install
RUN echo "PATH=$PATH:/usr/local/bin" >> /home/$UNAMEX/.bash_profile
RUN echo "export PATH" >> /home/$UNAMEX/.bash_profile
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
RUN source /home/$UNAMEX/.bash_profile

CMD ["echo","Finished installing oce"]

RUN cd /home/$UNAMEX
RUN git clone https://github.com/PSUCompBio/pythonocc-core.git
RUN cd pythonocc-core && mkdir build && cd build 
RUN cmake .. -DPYTHONOCC_INSTALL_DIRECTORY:PATH=/usr/lib/python3.6/dist-packages/OCC
RUN make -j2
RUN make install


CMD ["echo","FInished installing Python OCC core"]

RUN pip3 install vtk

RUN cd /home/$UNAMEX 
RUN git clone https://github.com/PSUCompBio/rbf-brain && git clone https://github.com/mathLab/PyGeM

COPY cp /home/$UNAMEX/rbf-brain/__init__.py /home/$UNAMEX/PyGeM/pygem
RUN cd /home/$UNAMEX/PyGeM
RUN python3 setup.py install
RUN pip3 install runipy
RUN cd /home/$UNAMEX

CMD ["echo","FInished installing pygem"]

COPY /home/$UNAMEX/rbf-brain/RBFfinal.ipynb /home/$UNAMEX/PyGeM/tutorials/
COPY /home/$UNAMEX/rbf-brain/RBFfinal.py /home/$UNAMEX/PyGeM/tutorials/
COPY /home/$UNAMEX/rbf-brain/initialmesh.vtk /home/$UNAMEX/PyGeM/tests/test_datasets/
COPY /home/$UNAMEX/rbf-brain/parameters_rbf_custom.prm /home/$UNAMEX/PyGeM/tests/test_datasets/

CMD ["echo","Completed RBF setup"]

RUN git clone https://github.com/PSUCompBio/vtk-image-write
RUN cd vtk-image-write
RUN xvfb-run --server-args="-screen 0 1024x768x24" python3 write-image.py

CMD ["echo","Completed Imae Write test"]

RUN cd /home/$UNAMEX
RUN git clone https://github.com/Kitware/VTK
RUN export VTK_ROOT=/home/$UNAMEX/VTK
RUN cd $VTK_ROOT
RUN mkdir build && cd build
RUN cmake ../ -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
RUN make -j2:
RUN cd /home/$UNAMEX
RUN echo "export LD_LIBRARY_PATH=$VTK_ROOT/build/bin:$VTK_ROOT/build/lib:$LD_LIBRARY_PATH" >> /home/$UNAMEX/.bash_profile
RUN source /home/$UNAMEX/.bash_profile

CMD echo ["echo","Completed vtk install"]

RUN cd /home/$UNAMEX
RUN git clone https://github.com/PSUCompBio/FemTech
RUN cd FemTech
RUN mkdir build && cd build
RUN cmake .. -DEXAMPLES=ON -DEXAMPLE12=ON -DEXAMPLE7=ON -DEXAMPLE9=ON
RUN make -j2

CMD ["echo","femtech install completed"]

RUN cd /home/$UNAMEX
RUN git clone https://github.com/PSUCompBio/MergePolyData
RUN cd MergePolyData
RUN mkdir build
RUN cd build
RUN cmake .. -DVTK_DIR=$VTK_ROOT/build
RUN make -j2


RUN cd /home/$UNAMEX
RUN npx create-react-app $WEBSITENAME
RUN cd /home/$UNAMEX/$WEBSITENAME
RUN npm run build

RUN cd /home/$UNAMEX
RUN chown -R $UNAMEX *

