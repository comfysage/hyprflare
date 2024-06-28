DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: wincreate.1

wincreate.1: wincreate.1.scd
	scdoc < $< > $@

install: wincreate.1 wincreate
	@install -v -D -m 0644 wincreate.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 wincreate --target-directory "$(BINDIR)"

uninstall: wincreate.1 wincreate
	rm "$(MAN1DIR)/wincreate.1"
	rm "$(BINDIR)/wincreate"

.PHONY: all install uninstall clean test
