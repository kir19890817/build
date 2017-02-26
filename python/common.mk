-include $(DEPTH)/../build_spec/python/specific.mk
# Каталог компиляции программ
BIN = $(INS)/bin
# Каталог с настроечными файлами
ETC = $(INS)/etc
LIBS = $(INS)/lib
USRINC = $(INS)/include
EXTINC ?= $(USRINC)
ETXLIBS ?= $(LIBS) 
# Платформа
SYS = python
OSUF = o
OBJDIR = obj_py
PYTHON = $(shell echo $$PYTHONHOME)

CXX = g++
CXXFLAGS = -I$(DEPTH)/ -I$(PYTHON)/include -I$(EXTINC) -I$(USRINC) \
					 -I$(DEPTH)/../../install/usr/include

NO_HEADERINS = 1
