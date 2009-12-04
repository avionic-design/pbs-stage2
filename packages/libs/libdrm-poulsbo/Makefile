PACKAGE = libdrm-poulsbo
VERSION = 2.3.0

TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libdrm.la

stripfiles = \
	$(prefix)/lib/libdrm.so.$(VERSION)
