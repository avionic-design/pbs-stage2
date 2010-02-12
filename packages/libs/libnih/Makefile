PACKAGE = libnih
VERSION = 1.0.1

LOCATION = http://upstart.ubuntu.com/download/libnih/1.0
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libnih.la \
	$(prefix)/lib/libnih-dbus.la

stripfiles = \
	$(prefix)/bin/nih-dbus-tool \
	$(prefix)/lib/libnih.so.1.0.0 \
	$(prefix)/lib/libnih-dbus.so.1.0.0
