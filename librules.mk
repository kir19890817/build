TARGETINS = $(patsubst %, $(LIBS)/%, $(TARGET))
HEADERSINS = $(patsubst %.o, $(USRINC)/$(LIBDIR)/%.h, $(OBJS))
LIBDIRINS = $(USRINC)/$(LIBDIR)

ifndef NO_HEADERINS
all: $(HEADERSINS) $(TARGETINS)
else
all: $(TARGETINS)
endif

$(HEADERSINS): $(patsubst %.o, %.h, $(OBJS))
	@[ -d $(LIBDIRINS) ] || mkdir -p $(LIBDIRINS)
	@for i in $+; do cp -f $$i $(LIBDIRINS); done

$(TARGETINS): $(patsubst %.o, $(TEMP)/$(TARGET)/$(OBJDIR)/%.o, $(OBJS))
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@$(AR) rcs $@ $^ 

include $(DEPTH)/../build/objrules.mk

.PHONY: clean
ifndef NO_HEADERINS
clean: cleandep cleanobj
	@-rm $(TARGETINS)
	@-rm $(LIBDIRINS)/*.h
else
clean: cleandep cleanobj
	@-rm $(TARGETINS)
endif

include $(DEPTH)/../build/deprules.mk
