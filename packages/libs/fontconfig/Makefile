PACKAGE = fontconfig
VERSION = 2.7.1

LOCATION = http://fontconfig.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-arch=$(ARCH)

prunefiles = \
	$(prefix)/lib/libfontconfig.la

stripfiles = \
	$(prefix)/bin/fc-cache \
	$(prefix)/bin/fc-cat \
	$(prefix)/bin/fc-list \
	$(prefix)/bin/fc-match \
	$(prefix)/bin/fc-query \
	$(prefix)/bin/fc-scan \
	$(prefix)/lib/libfontconfig.so.1.4.1
