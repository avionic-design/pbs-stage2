PACKAGE = xterm
VERSION = 268

LOCATION = ftp://invisible-island.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tgz

include packages/xorg/app/common.mk

conf-args += \
	--disable-imake \
	--with-pkg-config=$(srctree)/toolchains/$(TARGET)/usr/bin/$(TARGET)-pkg-config

prunefiles =
stripfiles = \
	$(prefix)/bin/resize \
	$(prefix)/bin/xterm
