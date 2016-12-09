PACKAGE = cmake
VERSION = 3.7.1
LICENSE = custom

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.cmake.org/files/v$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/build-tools/autotools.mk

conf-args = \
	--prefix=$(prefix)
