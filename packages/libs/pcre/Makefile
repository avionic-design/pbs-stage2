PACKAGE = pcre
VERSION = 8.33
LICENSE = BSD

LOCATION = ftp://ftp.cs.stanford.edu/pub/exim/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(pkgbuildtree)/m4

conf-args += \
	--enable-unicode-properties

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/pcregrep \
	$(prefix)/bin/pcretest \
	$(prefix)/lib/*.so.*
