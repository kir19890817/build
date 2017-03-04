include $(DEPTH)/../build/common.mk
-include $(DEPTH)/../build_spec/python/specific.mk
# Каталог компиляции программ
USRINC = $(INS)/include
EXTINC ?= $(USRINC)
ETXLIBS ?= $(LIBS) 
# Платформа
SYS = python
OSUF = o
OBJDIR = obj_py
PYTHON = $(shell echo $$PYTHONHOME)

CXX = g++
CXXFLAGS += -I$(DEPTH)/ -I$(PYTHON)/include -I$(EXTINC)  \
					 -I$(DEPTH)/../../install/usr/include

NO_HEADERINS = 1
