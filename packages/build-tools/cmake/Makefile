PACKAGE = cmake
VERSION = 2.8.10
LICENSE = custom

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.cmake.org/files/v$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/build-tools/autotools.mk
