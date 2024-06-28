DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: colorpicker.1

colorpicker.1: colorpicker.1.scd
	scdoc < $< > $@

install: colorpicker.1 colorpicker
	@install -v -D -m 0644 colorpicker.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 colorpicker --target-directory "$(BINDIR)"

uninstall: colorpicker.1 colorpicker
	rm "$(MAN1DIR)/colorpicker.1"
	rm "$(BINDIR)/colorpicker"

.PHONY: all install uninstall clean test
