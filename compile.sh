#!/bin/bash

source bemppEnv.sh

#
# Build python
#
if [ ! -e python.stamp ]
then
    cd Src/Python
    tar xf Python-2.7.13.tar.xz
    cd Python-2.7.13
    CFLAGS="-fPIC" CPPFLAGS="-fPIC" ./configure --prefix=$BEMPP_INSTALL_ROOT --enable-shared
    make -j12
    make install
    cd ../../../
touch python.stamp
fi

#
# Install Cython Cython-0.25.2.tar.gz
#
if [ ! -e cython.stamp ]
then
    cd Src/Cython
    tar xfz Cython-0.25.2.tar.gz
    cd Cython-0.25.2
    python setup.py build
    python setup.py install
    cd ../../../
    touch cython.stamp
fi

#
# Install nose python library
#
if [ ! -e nose.stamp ]
then
    cd Src/Nose
    tar xfz nose-1.3.7.tar.gz
    cd nose-1.3.7
    python setup.py build
    python setup.py install
    cd ../../../
    touch nose.stamp
fi

#
# Install LAPACK/BLAS library
#
if [ ! -e lapack.stamp ]
then
    cd Src/Lapack
    tar xfz lapack-3.7.0-bempp.tgz
    cd lapack-3.7.0-bempp
    make lib
    THIS_DIR=`pwd`
    cd $BEMPP_INSTALL_ROOT/lib
    ln -s $THIS_DIR/liblapack.so liblapack.so
    cd ../include
    cp $THIS_DIR/CBLAS/include/cblas.h  ./
    cp $THIS_DIR/CBLAS/include/cblas_f77.h ./
    cp $THIS_DIR/CBLAS/include/cblas_mangling.h ./
    cp $THIS_DIR/CBLAS/include/cblas_test.h ./
    cd $THIS_DIR
    cd ../../../
    touch lapack.stamp
fi

#
# Install setuptools
#
if [ ! -e setuptools.stamp ]
then
    cd Src/Setuptools
    tar xfz six-1.10.0.tar.gz
    cd six-1.10.0
    python setup.py build
    python setup.py install
    cd ../
    tar xfz packaging-16.8.tar.gz
    cd packaging-16.8
    python setup.py build
    python setup.py install
    cd ../
    tar xfz pyparsing-2.2.0.tar.gz
    cd pyparsing-2.2.0
    python setup.py build
    python setup.py install
    cd ../
    tar xfz appdirs-1.4.3.tar.gz
    cd appdirs-1.4.3
    python setup.py build
    python setup.py install
    cd ../
    unzip setuptools-34.3.3.zip
    cd setuptools-34.3.3
    python setup.py build
    python setup.py install
    cd ../../../
    touch setuptools.stamp
fi

#
# Install NumPy
#
if [ ! -e numpy.stamp ]
then
    cd Src/NumPy
    unzip numpy-1.12.1.zip
    cd numpy-1.12.1
    cp ../site.cfg ./
    python setup.py build
    python setup.py install
    cd ../../../
    touch numpy.stamp
fi

#
# Install SciPy
#
if [ ! -e scipy.stamp ]
then
    cd Src/SciPy
    unzip scipy-0.19.0.zip
    cd scipy-0.19.0
    python setup.py build
    python setup.py install
    cd ../../../
    touch scipy.stamp
fi

#
# Install mpi4py
#
if [ ! -e mpi4py.stamp ]
then
    cd Src/Mpi4py
    tar xfz mpi4py-2.0.0.tar.gz
    cd mpi4py-2.0.0
    python setup.py build
    python setup.py install
    cd ../../../
    touch mpi4py.stamp
fi

#
# Install PatchElf
#
if [ ! -e patchelf.stamp ]
then
    cd Src/PatchElf
    tar xfz patchelf-0.8.tar.gz
    cd patchelf-0.8
    ./configure --prefix=$BEMPP_INSTALL_ROOT
    make -j12
    make install
    cd ../../../
    touch patchelf.stamp
fi

#
# Install TBB
#
if [ ! -e tbb.stamp ]
then
    cd Src/Tbb
    tar xfz tbb43_20150209oss_src.tgz
    cd tbb43_20150209oss
    make default
    cd build
    rdir=`ls -d *_release`
    cd $rdir
    rm -rf *.so
    ln -s libtbb.so.2 libtbb.so
    ln -s libtbbmalloc.so.2 libtbbmalloc.so
    ln -s libtbbmalloc_proxy.so.2 libtbbmalloc_proxy.so
    #copy libraries
    cp -rf libtbb*.so* $BEMPP_INSTALL_ROOT/lib/
    #copy includes
    cd ../../
    cp -rf include/tbb $BEMPP_INSTALL_ROOT/include/
    cd ../
    cd ../../
    touch tbb.stamp
fi

#
# Install boost
#
if [ ! -e boost.stamp ]
then
    cd Src/Boost
    #
    tar jxf boost_1_57_0.tar.bz2
    cd boost_1_57_0
    ./bootstrap.sh --prefix=$BEMPP_INSTALL_ROOT
    ./b2
    ./b2 install
    cd ../../../
    touch boost.stamp
#    make
#    make install
fi

#
# Install DUNE
#
if [ ! -e dune.stamp ]
then
    cd Src/Dune
    #
    tar xfz dune-common-2.4.1.tar.gz
    cd dune-common-2.4.1
    CFLAGS="-fPIC" CPPFLAGS="-fPIC" LDFLAGS="-L$BEMPP_INSTALL_ROOT/lib" LIBS="-lblas -llapack" ./configure --prefix=$BEMPP_INSTALL_ROOT --enable-shared
    make -j12
    make install
    cd ../
    #
    tar xfz dune-geometry-2.4.1.tar.gz
    cd dune-geometry-2.4.1
    CFLAGS="-fPIC" CPPFLAGS="-fPIC"  PKG_CONFIG_PATH="$BEMPP_INSTALL_ROOT/lib/pkgconfig" LDFLAGS="-L$BEMPP_INSTALL_ROOT/lib" ./configure --prefix=$BEMPP_INSTALL_ROOT --enable-shared
    make -j12
    make install
    cd ../
    #
    tar xfz dune-grid-2.4.1.tar.gz
    cd dune-grid-2.4.1
    CFLAGS="-fPIC" CPPFLAGS="-fPIC"  PKG_CONFIG_PATH="$BEMPP_INSTALL_ROOT/lib/pkgconfig" LDFLAGS="-L$BEMPP_INSTALL_ROOT/lib" ./configure --prefix=$BEMPP_INSTALL_ROOT --enable-shared
    make -j12
    make install
    cd ../
    #
    tar xfz dune-localfunctions-2.4.1.tar.gz
    cd dune-localfunctions-2.4.1
    CFLAGS="-fPIC" CPPFLAGS="-fPIC"  PKG_CONFIG_PATH="$BEMPP_INSTALL_ROOT/lib/pkgconfig" LDFLAGS="-L$BEMPP_INSTALL_ROOT/lib" ./configure --prefix=$BEMPP_INSTALL_ROOT --enable-shared
    make -j12
    make install
    cd ../../../
    #
    touch dune.stamp
fi

#
# Install Eigen3
#
if [ ! -e eigen3.stamp ]
then
    cd Src/Eigen3
    tar xfz eigen3.3.3.tar.gz
    cd eigen-eigen-67e894c6cd8f
    cp -rf Eigen $BEMPP_INSTALL_ROOT/include/
    
    cd ../
    cd ../../
    #
    touch eigen3.stamp
fi

#
# Install BEM++
#
if [ ! -e bempp.stamp ]
then
    cd Src/Bempp
    tar xfz Bempp-latest-git.tgz
    cd Bempp
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$BEMPP_INSTALL_ROOT ..
    make -j12 #12 - number of processors
    make install
    cd ../../../../
    touch bempp.stamp
fi

#
#END-OF-FILE
#


