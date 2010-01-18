PACKAGE = bash
VERSION = 4.1

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--bindir=/bin

ifeq ($(ARCH),blackfin)
conf-args += \
	--with-bash-malloc=no
endif

prunefiles =
stripfiles = \
	/bin/bash
