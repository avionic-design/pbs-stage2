PACKAGE = fuse
VERSION = 2.9.2
LICENSE = GPL

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	/sbin/mount.fuse \
	$(prefix)/bin/fusermount \
	$(prefix)/bin/ulockmgr_server\
	$(prefix)/lib/*.so
