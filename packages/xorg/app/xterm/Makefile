PACKAGE = xterm
VERSION = 276

LOCATION = ftp://invisible-island.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tgz

include packages/xorg/app/common.mk

conf-args += \
	--disable-imake \
	--enable-wide-chars \
	--enable-256-color \
	--enable-88-color \
	--enable-mini-luit \
	--enable-luit

stripfiles = \
	$(prefix)/bin/resize \
	$(prefix)/bin/xterm
