PACKAGE = awesome
VERSION = 3.4.10

LOCATION = http://$(PACKAGE).naquadah.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/cmake.mk

cmake-args += \
	-DSYSCONFDIR=/etc

stripfiles = \
	$(prefix)/bin/awesome
