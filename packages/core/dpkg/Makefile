PACKAGE = dpkg
VERSION = 1.18.23

LOCATION = http://ftp.debian.org/debian/pool/main/d/dpkg
TARBALLS = $(PACKAGE)_$(VERSION).tar.xz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/dpkg-deb \
	$(prefix)/bin/dselect \
	$(prefix)/bin/dpkg \
	$(prefix)/bin/dpkg-split \
	$(prefix)/bin/dpkg-query \
	$(prefix)/bin/dpkg-statoverride \
	$(prefix)/bin/dpkg-trigger \
	$(prefix)/sbin/start-stop-daemon \
	$(prefix)/sbin/install-info
