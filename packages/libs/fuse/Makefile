PACKAGE = fuse
VERSION = 2.9.5
LICENSE = GPL

LOCATION = https://github.com/libfuse/libfuse/releases/download/$(PACKAGE)_$(subst .,_,$(VERSION))
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	/sbin/mount.fuse \
	$(prefix)/bin/fusermount \
	$(prefix)/bin/ulockmgr_server\
	$(prefix)/lib/*.so
