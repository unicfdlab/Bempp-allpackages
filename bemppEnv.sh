#!/bin/bash

export BEMPP_ROOT=/unicluster/home/matvey.kraposhin/run/bempp

export BEMPP_INSTALL_ROOT=$BEMPP_ROOT/Install

export PATH=$BEMPP_INSTALL_ROOT/bin:$PATH
export LD_LIBRARY_PATH=$BEMPP_INSTALL_ROOT/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$BEMPP_INSTALL_ROOT/lib/python2.7

export CPLUS_INCLUDE_PATH=$BEMPP_INSTALL_ROOT/include
export C_INCLUDE_PATH=$BEMPP_INSTALL_ROOT/include

source Src/Tbb/tbbvars.sh intel64
export TBB_LIBRARY_DIR=$TBBROOT/lib/intel64/gcc4.4
export TBB_INCLUDE_DIR=$TBBROOT/include/tbb


#
#END-OF-FILE
#


