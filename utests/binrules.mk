ifeq ($(shell echo $$OSTYPE), msys)
	EXEPOSTFIX=.exe
else
	EXEPOSTFIX=
endif

include $(DEPTH)/../build/utests/common.mk
include $(DEPTH)/../build/binrules.mk

.PHONY: run
run: $(BIN)/$(TARGET)$(EXEPOSTFIX)
	$(BIN)/$(TARGET)
