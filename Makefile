all clean install:
	@$(MAKE) -s -C aflex $@
	@$(MAKE) -s -C ayacc $@

.PHONY: all clean install	
