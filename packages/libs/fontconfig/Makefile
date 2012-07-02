PACKAGE = fontconfig
VERSION = 2.9.0

LOCATION = http://fontconfig.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--with-arch=$(ARCH) \
	--disable-libxml2

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
