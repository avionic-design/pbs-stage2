PACKAGE = dropbear
VERSION = 2016.74
LICENSE = MIT

LOCATION = http://matt.ucc.asn.au/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--enable-bundled-libtom

# Out-of-tree builds are a tad broken without additional include paths
conf-vars += \
	CFLAGS="$(CFLAGS) -I$(pkgbuildtree)/libtommath -I$(pkgtree)/build/obj-$(TARGET)"

stripfiles = \
	$(prefix)/bin/dbclient \
	$(prefix)/bin/dropbearconvert \
	$(prefix)/bin/dropbearkey \
	$(prefix)/sbin/dropbear
