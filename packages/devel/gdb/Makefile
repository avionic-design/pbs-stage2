PACKAGE = gdb
VERSION = 7.12
LICENSE = GPL

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-separate-debug-dir=/debug

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gdb \
	$(prefix)/bin/gdbserver \
	$(prefix)/bin/gdbtui \
	$(prefix)/bin/run
