include ../build_spec/targets.mk

reverse = $(if $(1),$(call reverse,$(wordlist 2,$(words $(1)),$(1)))) $(firstword $(1))

ALL = $(LIBS) $(APPS) 

HOST = $(shell uname -s | tr A-Z a-z)
MEXEXT = mex

ifeq ($(HOST), linux)
MEXEXT = mexgl
endif

.PHONY: all
all: 
	for i in $(ALL); do $(MAKE) -f Makefile.qnx -C ../src/$$i; done

.PHONY: clean
clean: 
	for i in $(call reverse,$(ALL)); do $(MAKE) -s -f Makefile.qnx -C ../src/$$i clean; done

.PHONY: mex
mex:
	for i in $(MEX); do $(MAKE) -f Makefile.$(MEXEXT) -C ../src/$$i; done
	for i in $(MEXTESTS); do $(MAKE) -f Makefile.$(MEXEXT) -C ../src/$$i/mtests; done

.PHONY: mex_clean
mex_clean:
	for i in $(call reverse,$(MEX)); do $(MAKE) -s -f Makefile.$(MEXEXT) -C ../src/$$i clean; done
	for i in $(call reverse,$(MEXTESTS)); do $(MAKE) -s -f Makefile.$(MEXEXT) -C ../src/$$i/mtests clean; done

.PHONY: py
py:
	for i in $(PYTHON); do $(MAKE) -f Makefile.pymod -C ../src/$$i; done
	for i in $(PYTESTS); do $(MAKE) -f Makefile.pymod -C ../src/$$i/pytests; done

.PHONY: py_clean
py_clean:
	for i in $(call reverse, $(PYTHON)); do $(MAKE) -s -f Makefile.pymod -C ../src/$$i clean; done
	for i in $(call reverse, $(PYTESTS)); do $(MAKE) -s -f Makefile.pymod -C ../src/$$i/pytests clean; done

.PHONY: l, lin
l lin: linux

.PHONY: linux
linux:
	for i in $(ALL); do $(MAKE) -f Makefile.linux -C ../src/$$i; done

.PHONY: linux_clean
linux_clean:
	for i in $(call reverse,$(ALL)); do $(MAKE) -s -f Makefile.linux -C ../src/$$i clean; done

.PHONY: u
u: utests

.PHONY: utests
utests:
	for i in $(NATIVELIBS); do $(MAKE) -f Makefile.nat -C ../src/$$i; done
	for i in $(UTESTS); do $(MAKE) -f Makefile.utest -C ../src/$$i/utests run; done

.PHONY: utests_clean
utests_clean:
	for i in $(call reverse,$(NATIVELIBS)); do $(MAKE) -s -f Makefile.nat -C ../src/$$i clean; done
	for i in $(call reverse,$(UTESTS)); do $(MAKE) -s -f Makefile.utest -C ../src/$$i/utests clean; done

.PHONY: nat
nat:
	for i in $(NATIVELIBS); do $(MAKE) -f Makefile.nat -C ../src/$$i; done
	for i in $(NATIVEAPPS); do $(MAKE) -f Makefile.nat -C ../src/$$i; done

.PHONY: nat_clean
nat_clean:
	for i in $(call reverse,$(NATIVELIBS)); do $(MAKE) -s -f Makefile.nat -C ../src/$$i clean; done
	for i in $(call reverse,$(NATIVEAPPS)); do $(MAKE) -s -f Makefile.nat -C ../src/$$i clean; done
