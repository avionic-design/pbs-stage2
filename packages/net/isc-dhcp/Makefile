PACKAGE = dhcp
VERSION = 4.1.1b1

LOCATION = http://ftp.isc.org/isc/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = DHCP client

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	ac_cv_file__dev_random=yes

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
	$(call cmd,install_bin,$(pkgtree)/client/scripts/linux,$(ROOTFS)/etc/dhclient-script)

prunefiles =
stripfiles = \
	$(prefix)/bin/omshell \
	$(prefix)/sbin/dhclient \
	$(prefix)/sbin/dhcpd \
	$(prefix)/sbin/dhcrelay

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

