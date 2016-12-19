PACKAGE = sshfs
VERSION = 2.8

LOCATION = https://github.com/libfuse/sshfs/archive
TARBALLS = $(PACKAGE)_$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/$(PACKAGE)-$(PACKAGE)_$(VERSION)

include packages/autotools-reconf.mk

stripfiles = \
	$(prefix)/bin/sshfs
