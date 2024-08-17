# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/remote-encoder
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share/remote-encoder

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard remote-encoder/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-configs install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-scripts:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 remote-encoder/remote-encoder "$(BIN_DIR)"

install-configs:

	install -vdm 755 "$(DATA_DIR)/configs"

.PHONY: check install install-configs install-doc install-scripts shellcheck
