include $(DEPTH)/../build/mexgl/common.mk

MEXEXT = $(shell mexext)
TARGETINS = $(patsubst %, $(BIN)/%, $(TARGET))

all: $(TARGETINS)

ifneq ($(TARGETINS),$(TARGET))
$(TARGETINS): $(TARGET)
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@cp -f $(TARGET).$(MEXEXT) $(dir $(TARGETINS))
endif

$(TARGET): $(patsubst %.o, $(TEMP)/$(TARGET)/$(OBJDIR)/%.$(OSUF), $(OBJS))
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@mex -g $+ -L$(LIBS) -L$(EXTLIBS) $(USERLIBS) -cxx -outdir $(dir $@)

include $(DEPTH)/../build/mexgl/objrules.mk

.PHONY: clean
clean: cleandep cleanobj
	@-rm $(TARGET).$(MEXEXT)
	@-rm $(BIN)/$(TARGET).$(MEXEXT)

include $(DEPTH)/../build/deprules.mk
