PACKAGE = libical
VERSION = 2.0.0
LICENSE = MPLv1/LGPLv2.1

LOCATION = https://github.com/libical/libical/archive/
TARBALLS = v$(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/cmake.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
