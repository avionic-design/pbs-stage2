PACKAGE = fuse
VERSION = 2.8.6

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	/sbin/mount.fuse \
	$(prefix)/bin/fusermount \
	$(prefix)/bin/ulockmgr_server\
	$(prefix)/lib/*.so
