PACKAGE = xterm
VERSION = 327
LICENSE = custom

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

ifeq ($(CONFIG_PACKAGE_LIBS_NCURSES_WIDECHAR),y)
  build-args += LDFLAGS='-lncursesw'
else
  build-args += LDFLAGS='-lncurses'
endif

stripfiles = \
	$(prefix)/bin/resize \
	$(prefix)/bin/xterm
