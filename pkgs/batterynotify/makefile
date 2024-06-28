DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: batterynotify.1

batterynotify.1: batterynotify.1.scd
	scdoc < $< > $@

install: batterynotify.1 batterynotify
	@install -v -D -m 0644 batterynotify.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 batterynotify --target-directory "$(BINDIR)"

uninstall: batterynotify.1 batterynotify
	rm "$(MAN1DIR)/batterynotify.1"
	rm "$(BINDIR)/batterynotify"

.PHONY: all install uninstall clean test
