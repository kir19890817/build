include $(DEPTH)/../build/mexw/common.mk

MEXEXT = $(shell mexext.bat)
TARGETINS = $(patsubst %, $(BIN)/%.$(MEXEXT), $(TARGET))

all: $(TARGETINS)

ifneq ($(TARGETINS),$(TARGET))
$(TARGETINS): $(TARGET)
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	cp -f $(TARGET).mex*[1-9][1-9] $(dir $(TARGETINS))
endif

$(TARGET): $(patsubst %.o, $(TEMP)/$(TARGET)/$(OBJDIR)/%.obj, $(OBJS))
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	$(SHELLCMD) "mex -g $+ -L$(LIBS) -L$(EXTLIBS) $(USERLIBS) -outdir $(dir $@)"

include $(DEPTH)/../build/mexw/objrules.mk

.PHONY: clean
clean: cleandep cleanobj
	-rm $(TARGET).$(MEXEXT)
	-rm $(BIN)/$(TARGET).$(MEXEXT)
	-rm *.pdb

include $(DEPTH)/../build/deprules.mk
