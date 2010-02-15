PACKAGE = gdb
VERSION = 6.8

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libbfd.la \
	$(prefix)/lib/libopcodes.la

stripfiles = \
	$(prefix)/bin/gdb \
	$(prefix)/bin/gdbserver \
	$(prefix)/bin/gdbtui \
	$(prefix)/bin/run
