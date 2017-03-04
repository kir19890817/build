include $(DEPTH)/../build/common.mk
-include $(DEPTH)/../build_spec/utests/specific.mk

SYS ?= $(shell uname -s | tr A-Z a-z)
CXXFLAGS += -I$(DEPTH)/../src/

CXX = g++ 
AR = ar
OSUF = o
OBJDIR = obj_nat

