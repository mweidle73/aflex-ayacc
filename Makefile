all clean install:
	@$(MAKE) -s -C aflex $@
	@$(MAKE) -s -C ayacc $@

check:
	@$(MAKE) -s -C aflex/src $@
	@$(MAKE) -s -C ayacc/src $@

.PHONY: all check clean install
