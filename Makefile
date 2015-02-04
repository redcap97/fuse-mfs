COMMANDS = all install clean test

DOCKER = docker
DOCKER_FLAGS = -v $$(pwd):/cache:ro -e "block_size=$(BLOCK_SIZE)" --rm
BLOCK_SIZE = 4096
IMAGE_NAME = fuse-mfs

.PHONY: $(COMMANDS)

$(COMMANDS):
	$(MAKE) -C src  $@
	$(MAKE) -C mkfs $@
	$(MAKE) -C fsck $@

install: all

test:
	$(DOCKER) build -t $(IMAGE_NAME) test/docker
	$(DOCKER) run --privileged $(DOCKER_FLAGS) $(IMAGE_NAME)
