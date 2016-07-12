PACKAGE = libantlr3c
VERSION = 3.5.2
LICENSE = BSD

LOCATION = https://github.com/antlr/antlr3/archive/
TARBALLS = $(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree = $(pkgtree)/antlr3-$(VERSION)/runtime/C

include packages/autotools.mk

conf-args += \
	--enable-silent-rules

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so
