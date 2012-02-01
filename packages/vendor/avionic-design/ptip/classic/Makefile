PACKAGE = ptip-classic
VERSION = 0.0.0

LOCATION =
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--enable-maintainer-mode \
	--with-keypad \
	--with-framebuffer \
	--with-linphone

stripfiles = \
        $(prefix)/bin/ptip
