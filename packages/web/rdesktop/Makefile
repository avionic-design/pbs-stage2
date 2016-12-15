PACKAGE = rdesktop
VERSION = 1.8.3
LICENSE = GPLv3

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-openssl=$(SYSROOT)$(prefix) \
	--disable-credssp

stripfiles = \
	$(prefix)/bin/rdesktop
