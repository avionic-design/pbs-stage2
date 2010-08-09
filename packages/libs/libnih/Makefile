PACKAGE = libnih
VERSION = 1.0.2

MAJOR   = $(word 1,$(subst ., ,$(VERSION)))
MINOR   = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://upstart.ubuntu.com/download/libnih/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libnih.la \
	$(prefix)/lib/libnih-dbus.la

stripfiles = \
	$(prefix)/bin/nih-dbus-tool \
	$(prefix)/lib/libnih.so.1.0.0 \
	$(prefix)/lib/libnih-dbus.so.1.0.0
