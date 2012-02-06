PACKAGE = xterm
VERSION = 278

LOCATION = ftp://invisible-island.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tgz

include packages/xorg/app/common.mk

conf-args += \
	--disable-imake \
	--enable-wide-chars \
	--enable-256-color \
	--enable-88-color \
	--enable-mini-luit \
	--enable-luit \
	--x-includes=$(SYSROOT)$(prefix)/include \
	--x-libraries=$(SYSROOT)$(prefix)/lib

stripfiles = \
	$(prefix)/bin/resize \
	$(prefix)/bin/xterm
