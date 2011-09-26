PACKAGE = ptip-classic
VERSION = 0.0.0

LOCATION =
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-keypad \
	--with-framebuffer

stripfiles = \
        $(prefix)/bin/ptip
