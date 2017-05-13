include $(DEPTH)/../build/common.mk
-include $(DEPTH)/../build_spec/native/specific.mk

# Операционная система (linux/qnx)
SYS ?= $(shell uname -s | tr A-Z a-z)

ifeq ($(SYS),darwin)
	CXX = g++-7
else
	CXX = g++
endif

AR = ar
OSUF = o
OBJDIR = obj_nat
