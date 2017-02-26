$(TEMP)/$(TARGET)/$(OBJDIR)/%.$(OSUF):%.cpp
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@mex -g -I.. -I../.. -I$(EXTINC) -c $< -outdir $(dir $@) -DMATLAB_DBG

.PHONY: cleanobj
cleanobj:
	@-rm -R $(TEMP)/$(TARGET)/$(OBJDIR)

