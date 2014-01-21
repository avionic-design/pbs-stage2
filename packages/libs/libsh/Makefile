PACKAGE = libsh
VERSION = 0.3.10

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-vars += \
	ac_cv_prog_XSLTPROC=no

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
