CC      = gcc
INSTALL = install
DEPS    = $(OBJS:%.o=%.d)
PREFIX  = /usr/local

.PHONY: all install clean

all: $(TARGET)

install: all
	$(INSTALL) -D -m 755 $(TARGET) $(PREFIX)/bin/$(TARGET)

clean:
	rm -f $(OBJS) $(DEPS) $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

-include $(DEPS)
