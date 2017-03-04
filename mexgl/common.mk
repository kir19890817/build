-include $(DEPTH)/../build_spec/mexw/specific.mk
include $(DEPTH)/../build/common.mk
EXTINC ?= $(USRINC)
ETXLIBS ?= $(LIBS) 
SYS = mex
OSUF = o
OBJDIR = obj_mexgl
MATLAB = $(shell echo $$MATLAB)

CXX = g++

CXXFLAGS += -DMATLAB_MEX_FILE -I$(DEPTH)/ -I$(MATLAB)/rtw/c/src -I$(MATLAB)/simulink/include \
	-I$(MATLAB)/extern/include -I../ -DMATLAB_DBG -I$(EXTINC)
