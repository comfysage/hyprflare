DESTDIR ?= /
PREFIX ?= $(DESTDIR)usr/local
EXEC_PREFIX ?= $(PREFIX)
DATAROOTDIR ?= $(PREFIX)/share
BINDIR ?= $(EXEC_PREFIX)/bin
MANDIR ?= $(DATAROOTDIR)/man
MAN1DIR ?= $(MANDIR)/man1

all: tmux-select.1

tmux-select.1: tmux-select.1.scd
	scdoc < $< > $@

install: tmux-select.1 tmux-select
	@install -v -D -m 0644 tmux-select.1 --target-directory "$(MAN1DIR)"
	@install -v -D -m 0755 tmux-select --target-directory "$(BINDIR)"

uninstall: tmux-select.1 tmux-select
	rm "$(MAN1DIR)/tmux-select.1"
	rm "$(BINDIR)/tmux-select"

.PHONY: all install uninstall clean test
