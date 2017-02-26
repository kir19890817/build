$(TEMP)/$(TARGET)/$(OBJDIR)/%.obj:%.cpp
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	$(SHELLCMD) "mex -g COMPFLAGS=\"\$$COMPFLAGS /MT -I.. -I../.. -I$(EXTINC)\" -c $< -outdir $(dir $@) -DMATLAB_DBG"

.PHONY: cleanobj
cleanobj:
	-rm -R $(TEMP)/$(TARGET)/$(OBJDIR)

