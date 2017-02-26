include $(DEPTH)/../build/mexgl/common.mk

TARGETINS  = $(patsubst %, $(LIBS)/%, $(TARGET))
HEADERSINS = $(patsubst %.o, $(USRINC)/$(LIBDIR)/%.h, $(OBJS))
LIBDIRINS  = $(USRINC)/$(LIBDIR)

all: $(HEADERSINS) $(TARGETINS)

$(HEADERSINS): $(patsubst %.o, %.h, $(OBJS))
	@[ -d $(LIBDIRINS) ] || mkdir -p $(LIBDIRINS)
	@for i in $+; do cp -f $$i $(LIBDIRINS); done

$(TARGETINS): $(patsubst %.o, $(TEMP)/$(TARGET)/$(OBJDIR)/%.o, $(OBJS))
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@$(AR) rcvs $@ $^ 

include $(DEPTH)/../build/mexgl/objrules.mk

.PHONY: clean
clean: cleandep cleanobj
	@-rm $(TARGETINS)
	@-rm $(TARGET)
	@-rm $(LIBDIRINS)/*.h

include $(DEPTH)/../build/deprules.mk
