PACKAGE = libsh
VERSION = 0.3.2

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libsh.la

stripfiles = \
	$(prefix)/lib/libsh.so.0.0.0
