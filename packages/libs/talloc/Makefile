PACKAGE = talloc
VERSION = 2.1.9
LICENSE = LGPL

LOCATION = https://www.samba.org/ftp/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-vars += \
	ac_cv_prog_XSLTPROC=no

conf-args += \
	--disable-werror

stripfiles = \
	$(prefix)/lib/*.so.*
