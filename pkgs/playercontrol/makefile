DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: playercontrol.1

playercontrol.1: playercontrol.1.scd
	scdoc < $< > $@

install: playercontrol.1 playercontrol
	@install -v -D -m 0644 playercontrol.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 playercontrol --target-directory "$(BINDIR)"

uninstall: playercontrol.1 playercontrol
	rm "$(MAN1DIR)/playercontrol.1"
	rm "$(BINDIR)/playercontrol"

.PHONY: all install uninstall clean test
