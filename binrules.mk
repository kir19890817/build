TARGETINS = $(patsubst %, $(BIN)/%, $(TARGET))$(EXEPOSTFIX)

ifdef CONFIGS
	CONFIGSNAMES = $(notdir $(CONFIGS))
	CONFIGSINS = $(patsubst %, $(ETC)/%, $(CONFIGNAMES))
	all: $(TARGETINS) $(CONFIGSINS)
else
	all: $(TARGETINS)
endif

$(TARGETINS): $(patsubst %.o, $(TEMP)/$(TARGET)/$(OBJDIR)/%.o, $(OBJS)) $(LIBS)/*.a
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@$(CXX) -o $@ $^ -L$(LIBS) $(USRLIBS) $(SYSLIBS)

$(CONFIGSINS): $(CONFIGS)
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@for i in $(CONFIGS); do cp -f $$i $(ETC); done

include $(DEPTH)/../build/objrules.mk

.PHONY: clean
clean: cleanobj cleandep
	@-rm $(TARGETINS)

include $(DEPTH)/../build/deprules.mk
