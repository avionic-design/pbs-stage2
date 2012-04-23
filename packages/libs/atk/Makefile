PACKAGE = atk
VERSION = 2.4.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-glibtest

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
