PACKAGE = sysfsutils
VERSION = 2.1.0

LOCATION = http://prdownloads.sourceforge.net/linux-diag
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/dlist_test \
	$(prefix)/bin/get_device \
	$(prefix)/bin/get_driver \
	$(prefix)/bin/get_module \
	$(prefix)/bin/systool \
	$(prefix)/lib/*.so.*
