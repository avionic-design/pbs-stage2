PACKAGE = gtk-doc
VERSION = 1.25
LICENSE = GPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/build-tools/autotools.mk

conf-args += \
	--with-xml-catalog=$(prefix)/etc/xml/catalog
