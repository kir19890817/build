-include $(DEPTH)/../build_spec/mexw/specific.mk
# Каталог компиляции программ
BIN = $(INS)/bin
# Каталог с настроечными файлами
ETC = $(INS)/etc
LIBS = $(INS)/lib
USRINC = $(INS)/include
EXTINC ?= $(USRINC)
ETXLIBS ?= $(LIBS) 
# Платформа
SYS = mex
OSUF = o
OBJDIR = obj_mexgl
MATLAB = $(shell echo $$MATLAB)

CXX = g++
CXXFLAGS = -DMATLAB_MEX_FILE -I$(DEPTH)/ -I$(MATLAB)/rtw/c/src -I$(MATLAB)/simulink/include\
	-I$(MATLAB)/extern/include -I../ -DMATLAB_DBG -I$(EXTINC)
