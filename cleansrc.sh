#!/bin/bash

source bemppEnv.sh

cd Src/Python
    rm -rf Python-2.7.13 &
    cd ../../
    #rm -rf python.stamp

cd Src/Cython
    rm -rf Cython-0.25.2 &
    cd ../../
    #rm -rf cython.stamp

cd Src/Nose
    rm -rf nose-1.3.7 &
    cd ../../
    #rm -rf nose.stamp

cd Src/Lapack
    rm -rf lapack-3.7.0-bempp &
    cd ../../
    #rm -rf lapack.stamp

cd Src/Setuptools
    rm -rf six-1.10.0 &
    
    rm -rf packaging-16.8 &
    
    rm -rf pyparsing-2.2.0 &
    
    rm -rf appdirs-1.4.3 &
    
    rm -rf setuptools-34.3.3 &
    cd ../../
    #rm -rf setuptools.stamp

cd Src/NumPy
    rm -rf numpy-1.12.1 &
    cd ../../
    #rm -rf numpy.stamp

cd Src/SciPy
    rm -rf scipy-0.19.0 &
    cd ../../
    #rm -rf scipy.stamp

cd Src/PatchElf
    rm -rf patchelf-0.8 &
    cd ../../
    #rm -rf patchelf.stamp

cd Src/Tbb
    cd ../../
    #rm -rf tbb.stamp

cd Src/Boost
    rm -rf boost_1_57_0 &
    cd ../../
    #rm -rf boost.stamp

cd Src/Dune
    rm -rf dune-common-2.4.1 &
    rm -rf dune-geometry-2.4.1 &
    rm -rf dune-grid-2.4.1 &
    rm -rf dune-localfunctions-2.4.1 &
    cd ../../
    #rm -rf dune.stamp

cd Src/Bempp
    rm -rf Bempp &
    cd ../../
    #rm -rf bempp.stamp

#
#END-OF-FILE
#


