-include $(DEPTH)/../build_spec/native/specific.mk

# Каталог компиляции программ
BIN ?= $(INS)/bin
# Каталог с настроечными файлами
ETC ?= $(INS)/etc
LIBS ?= $(INS)/lib
USRINC ?= $(DEPTH)
# Операционная система (linux/qnx)
SYS ?= $(shell uname -s | tr A-Z a-z)

CXX = g++ -g
CXXFLAGS =-I$(USRINC) -I$(DEPTH)/../../install/usr/include
AR = ar
OSUF = o
OBJDIR = obj_nat
NO_HEADERINS = 1
