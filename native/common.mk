-include $(DEPTH)/../build_spec/native/specific.mk

# Каталог компиляции программ
BIN ?= $(INS)/bin
# Каталог с настроечными файлами
ETC ?= $(INS)/etc
LIBS ?= $(INS)/lib
USRINC ?= $(INS)/usr/include
# Операционная система (linux/qnx)
SYS ?= $(shell uname -s | tr A-Z a-z)

CXX = g++ -g -std=c++11
CXXFLAGS =-I$(USRINC)
AR = ar
OSUF = o
OBJDIR = obj_nat
