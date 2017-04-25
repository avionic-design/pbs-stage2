PACKAGE = libnotify
VERSION = 0.7.7

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-tests

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/notify-send \
	$(prefix)/lib/*.so.*
