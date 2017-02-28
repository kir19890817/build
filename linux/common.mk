-include $(DEPTH)/../build_spec/linux/specific.mk
# Каталог компиляции программ
BIN = $(INS)/bin
# Каталог с настроечными файлами
ETC = $(INS)/etc
# Каталог компиляции библиотек и модуля modwsr.ko
LIBS = $(INS)/lib
# Каталог компиляции библиотек и модуля modwsr.ko
USRINC = $(INS)/usr/include
# Операционная система (linux/qnx)
#SYS ?= $(shell uname -s | tr A-Z a-z)
SYS = linux

CXX = g++ -std=c++11
CXXFLAGS = -I$(USRINC) 
AR = ar
OSUF = o
OBJDIR = obj_linux
