-include $(OBJS:%.o=$(TEMP)/$(TARGET)/dep/%.d)

SED    = sed
CC-DEP = gcc
TARGDIRSED = $(subst /,\/,$(TEMP)/$(TARGET))

DEPCALLGCC=$(CC-DEP) -MM $(CPPFLAGS) $(CXXFLAGS)

DEPSEDPATTERN=\($(subst /,\/,$*)\)\.o[: ]

DEPSEDRESULT=$(TARGDIRSED)\/$(OBJDIR)\/\1.$(OSUF) $(TARGDIRSED)\/dep\/$(subst /,\/,$*).d :

DEPSEDCOMMAND=$(SED) 's/$(DEPSEDPATTERN)/$(DEPSEDRESULT) /g'
DEPDELIFEMPTY=[ -s $@ ] || rm -f $@

$(TEMP)/$(TARGET)/dep/%.d:%.cpp
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@set -e; $(DEPCALLGCC) $< | $(DEPSEDCOMMAND) > $@; $(DEPDELIFEMPTY)

.PHONY: cleandep
cleandep:
	@-rm -R $(TEMP)/$(TARGET)/dep

# Эти странные на первый взгляд цели предназначены для построения
# или обновления dep-файлов. Дело в том, что перед обработкой
# любой цели утилита make пытается обновить все include, которые
# можно обновить (см. выше). Ради этого побочного эффекта и добавлены
# эти пустые цели.
.PHONY: nothing build_deps deps
nothing build_deps deps:
	# Dep-files updated.
	

