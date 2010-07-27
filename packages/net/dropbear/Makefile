PACKAGE = dropbear
VERSION = 0.52

LOCATION = http://matt.ucc.asn.au/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

DESCRIPTION = tiny SSH server and client

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-args += \
	--disable-zlib

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='--sysroot $(ROOTFS)'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =
package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles =
stripfiles = \
	$(prefix)/bin/dbclient \
	$(prefix)/bin/dropbearconvert \
	$(prefix)/bin/dropbearkey \
	$(prefix)/sbin/dropbear

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

