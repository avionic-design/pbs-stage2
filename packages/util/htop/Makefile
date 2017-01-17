PACKAGE = htop
VERSION = 2.0.2
LICENSE = GPL

LOCATION = http://hisham.hm/$(PACKAGE)/releases/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--enable-silent-rules

ifeq ($(CONFIG_PACKAGE_LIBS_NCURSES_WIDECHAR),y)
  conf-args += --enable-unicode
else
  conf-args += --disable-unicode
endif

# The package supplies a config.h which gets included first, so remove it
$(pkgtree)/drop-old-config.h:
	rm -f $(pkgbuildtree)/config.h

$(pkgtree)/.build: $(pkgtree)/drop-old-config.h

stripfiles = \
	$(prefix)/bin/htop
