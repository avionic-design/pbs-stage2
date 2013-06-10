PACKAGE = libalsaloop
VERSION = 0.1.0
LICENSE = GPL

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-alsaloop-cmd

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/alsaloop-cmd \
	$(prefix)/lib/*.so.*
