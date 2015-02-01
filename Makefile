COMMANDS = all install clean

.PHONY: $(COMMANDS)

$(COMMANDS):
	$(MAKE) -C src  $@
	$(MAKE) -C mkfs $@
	$(MAKE) -C fsck $@

install: all
