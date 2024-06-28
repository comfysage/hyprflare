DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: wallselect.1

wallselect.1: wallselect.1.scd
	scdoc < $< > $@

install: wallselect.1 wallselect
	@install -v -D -m 0644 wallselect.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 wallselect --target-directory "$(BINDIR)"
	@install -v -D -m 0644 wallselect.rasi --target-directory "$(DATAROOTDIR)"

uninstall: wallselect.1 wallselect
	rm "$(MAN1DIR)/wallselect.1"
	rm "$(BINDIR)/wallselect"
	rm "$(DATAROOTDIR)/wallselect.rasi"

.PHONY: all install uninstall clean test
