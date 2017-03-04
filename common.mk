INS ?= ../install
BIN ?= $(INS)/bin
ETC ?= $(INS)/etc
LIBS ?= $(INS)/lib
USRINC ?= $(INS)/usr/include

CXXFLAGS = -I$(USRINC) -std=c++11

ifndef NDEBUG
CXXFLAGS += -D_DEBUG -g
endif
