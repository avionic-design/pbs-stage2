PACKAGE = vala
VERSION = 0.31.1
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://download.gnome.org/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/build-tools/autotools.mk

conf-vars += \
	ac_cv_path_XSLTPROC=:

prunefiles = \
	$(prefix)/lib/libvala-$(MAJOR).$(MINOR).la
