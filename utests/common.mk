include $(DEPTH)/../build/common.mk
-include $(DEPTH)/../build_spec/utests/specific.mk

SYS ?= $(shell uname -s | tr A-Z a-z)
CXXFLAGS += -I$(DEPTH)/../src/

ifeq ($(SYS),darwin)
	CXX = g++-7
else
	CXX = g++
endif

AR = ar
OSUF = o
OBJDIR = obj_nat

