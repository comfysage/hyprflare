DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: volumecontrol.1

volumecontrol.1: volumecontrol.1.scd
	scdoc < $< > $@

install: volumecontrol.1 volumecontrol
	@install -v -D -m 0644 volumecontrol.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 volumecontrol --target-directory "$(BINDIR)"

uninstall: volumecontrol.1 volumecontrol
	rm "$(MAN1DIR)/volumecontrol.1"
	rm "$(BINDIR)/volumecontrol"

.PHONY: all install uninstall clean test
