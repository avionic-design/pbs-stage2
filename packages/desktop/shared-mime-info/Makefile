PACKAGE = shared-mime-info
VERSION = 0.90

LOCATION = http://freedesktop.org/~hadess
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk
NUM_CPU := 1

conf-args += \
	--disable-update-mimedb

stripfiles = \
	$(prefix)/bin/update-mime-database
