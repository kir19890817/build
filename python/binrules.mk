include $(DEPTH)/../build/python/common.mk

MACHINE   = $(shell gcc -dumpmachine)

TARGETINS = $(patsubst %, $(BIN)/%, $(TARGET))

all: $(TARGETINS)

ifneq ($(TARGETINS),$(TARGET))
$(TARGETINS): $(TARGET)
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	cp -f $(TARGET) $(dir $(TARGETINS))
endif

$(TARGET): $(patsubst %.o, $(TEMP)/$(TARGET)/$(OBJDIR)/%.$(OSUF), $(OBJS))
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	#g++ -mdll -L$(LIBS) -L$(EXTLIBS) $(USERLIBS) -o $@
	-rm -R build 
	$(PYTHONHOME)/python setup.py build -c$(MACHINE)
	cp build/lib*/$(TARGET) ./

include $(DEPTH)/../build/python/objrules.mk

.PHONY: clean
clean: cleandep cleanobj
	-rm $(TARGET)
	-rm $(BIN)/$(TARGET)

include $(DEPTH)/../build/deprules.mk
