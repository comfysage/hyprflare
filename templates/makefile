DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: example.1

example.1: example.1.scd
	scdoc < $< > $@

install: example.1 example
	@install -v -D -m 0644 example.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 example --target-directory "$(BINDIR)"

uninstall: example.1 example
	rm "$(MAN1DIR)/example.1"
	rm "$(BINDIR)/example"

.PHONY: all install uninstall clean test
