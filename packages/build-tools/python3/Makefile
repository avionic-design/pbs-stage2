PACKAGE = Python
VERSION = 3.5.0

LOCATION = http://python.org/ftp/python/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/build-tools/autotools.mk

conf-args += \
	--with-system-ffi
