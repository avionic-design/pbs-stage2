PACKAGE = gdb
VERSION = 7.5.1
LICENSE = GPL

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gdb \
	$(prefix)/bin/gdbserver \
	$(prefix)/bin/gdbtui \
	$(prefix)/bin/run
