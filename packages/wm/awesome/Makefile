PACKAGE = awesome
VERSION = 3.4.12
LICENSE = GPL

LOCATION = http://$(PACKAGE).naquadah.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/cmake.mk

cmake-args += \
	-DSYSCONFDIR=/etc

stripfiles = \
	$(prefix)/bin/awesome
