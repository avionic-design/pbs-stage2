PACKAGE = rdesktop
VERSION = 1.6.0

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-openssl=$(ROOTFS)$(prefix)

stripfiles = \
	$(prefix)/bin/rdesktop
