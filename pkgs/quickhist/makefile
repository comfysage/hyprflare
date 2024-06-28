DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: quickhist.1

quickhist.1: quickhist.1.scd
	scdoc < $< > $@

install: quickhist.1 quickhist
	@install -v -D -m 0644 quickhist.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 quickhist --target-directory "$(BINDIR)"

uninstall: quickhist.1 quickhist
	rm "$(MAN1DIR)/quickhist.1"
	rm "$(BINDIR)/quickhist"

.PHONY: all install uninstall clean test
