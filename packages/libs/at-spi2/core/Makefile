PACKAGE = at-spi2-core
VERSION = 2.6.0
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--libexecdir=$(prefix)/lib/at-spi2

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/at-spi2/at-spi-bus-launcher \
	$(prefix)/lib/at-spi2/at-spi2-registryd
