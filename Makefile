DOCKER = docker
IMAGE_NAME = fuse-mfs
COMMANDS = all install clean test

.PHONY: $(COMMANDS)

$(COMMANDS):
	$(MAKE) -C src  $@
	$(MAKE) -C mkfs $@
	$(MAKE) -C fsck $@

install: all

test:
	$(DOCKER) build -t $(IMAGE_NAME) test/docker
	$(DOCKER) run --rm --privileged -v $$(pwd):/cache $(IMAGE_NAME)
