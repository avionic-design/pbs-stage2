PACKAGE = fontconfig
VERSION = 2.12.1
LICENSE = custom

LOCATION = http://fontconfig.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--with-arch=$(MACHINE) \
	--disable-docs

# force regeneration of this header until the release after 2.12.1
$(pkgtree)/.force-new-fcobjshash.h:
	rm -f $(pkgbuildtree)/src/fcobjshash.h

$(pkgtree)/.configure: $(pkgtree)/.force-new-fcobjshash.h

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/fc-cache \
	$(prefix)/bin/fc-cat \
	$(prefix)/bin/fc-list \
	$(prefix)/bin/fc-match \
	$(prefix)/bin/fc-pattern \
	$(prefix)/bin/fc-query \
	$(prefix)/bin/fc-scan \
	$(prefix)/lib/*.so.*
