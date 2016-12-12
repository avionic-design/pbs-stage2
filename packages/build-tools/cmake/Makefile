PACKAGE = cmake
VERSION = 3.7.1
LICENSE = custom

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.cmake.org/files/v$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/build-tools/autotools.mk

conf-args = \
	--prefix=$(prefix) \
	-- -DCMAKE_EXE_LINKER_FLAGS="-L $(prefix)/lib"
