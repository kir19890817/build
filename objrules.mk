$(TEMP)/$(TARGET)/$(OBJDIR)/%.o:%.cpp
	@[ -d $(dir $@) ] || mkdir -p $(dir $@)
	@$(CXX) $(CXXFLAGS) -c -o $@ $<

.PHONY: cleanobj
cleanobj:
	@-rm -R $(TEMP)/$(TARGET)/$(OBJDIR)

