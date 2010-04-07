PACKAGE = libnotify
VERSION = 0.4.5

LOCATION = http://www.galago-project.org/files/releases/source/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libnotify.la

stripfiles = \
	$(prefix)/bin/notify-send \
	$(prefix)/lib/libnotify.so.1.1.3
