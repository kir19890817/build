include $(DEPTH)/../build/mexw/common.mk

TARGETINS  = $(patsubst %, $(LIBS)/%, $(TARGET))
HEADERSINS = $(patsubst %.o, $(USRINC)/$(LIBDIR)/%.h, $(OBJS))
LIBDIRINS  = $(USRINC)/$(LIBDIR)

all: $(HEADERSINS) $(TARGETINS)

$(HEADERSINS): $(patsubst %.o, %.h, $(OBJS))
	@[ -d $(LIBDIRINS) ] || mkdir -p $(LIBDIRINS)
	for i in $+; do cp -f $$i $(LIBDIRINS); done

$(TARGETINS): $(TARGET)
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	cp -f $(TARGET) $(dir $(TARGETINS))

$(TARGET): $(patsubst %.o, $(TEMP)/$(TARGET)/$(OBJDIR)/%.obj, $(OBJS))
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	$(SHELLCMD) "\"C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\vcvarsall.bat\" %PROCESSOR_ARCHITECTURE% && LIB /out:$@ $(strip $+)"

include $(DEPTH)/../build/mexw/objrules.mk

.PHONY: clean
clean: cleandep cleanobj
	-rm $(TARGETINS)
	-rm $(TARGET)
	-rm $(LIBDIRINS)/*.h

include $(DEPTH)/../build/deprules.mk
