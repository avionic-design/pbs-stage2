PACKAGE = xterm
VERSION = 276

LOCATION = ftp://invisible-island.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tgz

include packages/xorg/app/common.mk

conf-args += \
	--disable-imake

stripfiles = \
	$(prefix)/bin/resize \
	$(prefix)/bin/xterm
