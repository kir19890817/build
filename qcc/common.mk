include $(DEPTH)/../build/common.mk
-include $(DEPTH)/../build_spec/qcc/specific.mk

SYS = qnx

CXX = ntox86-g++
CXXFLAGS = -I$(USRINC) 
AR = ntox86-ar
OSUF = o
OBJDIR = obj_qnx
