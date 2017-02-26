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
OSUF = obj
OBJDIR = obj_mexw

CXX = mex
CXXFLAGS = -I$(DEPTH)/ -I/c/MATLAB/R2014a/rtw/c/src \
	-I/c/MATLAB/R2014a/extern/include -I../ -DMATLAB_DBG -I$(EXTINC)
SHELLCMD = cmd.exe /c
