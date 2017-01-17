PACKAGE = iftop
VERSION = 1.0pre4
LICENSE = GPLv2

LOCATION = http://www.ex-parrot.com/pdw/iftop/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

# AC_LANG_SOURCE is misused by reading the actual source from the config/
# subdirectory, thereby breaking out-of-tree builds. Upstream probably should
# use m4 macros anyway for those tests, but let's avoid this using sed for now.
$(pkgtree)/.patch-configure.ac:
	cd $(pkgbuildtree) && \
		sed -i 's|cat config/|cat $(pkgbuildtree)/config/|g' configure.ac
	$(call cmd,stamp)

$(pkgtree)/.autoreconfigure: $(pkgtree)/.patch-configure.ac

conf-args += \
	--enable-silent-rules

stripfiles = \
	$(prefix)/sbin/*
