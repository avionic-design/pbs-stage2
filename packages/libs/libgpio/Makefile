PACKAGE = libgpio
VERSION = 0.5.0
LICENSE = GPL

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-vars += \
	ac_cv_prog_XSLTPROC=no

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/gpioctl \
	$(prefix)/lib/*.so.*
