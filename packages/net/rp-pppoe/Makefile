PACKAGE = rp-pppoe
VERSION = 3.10

LOCATION = http://www.roaringpenguin.com/files/download
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CC='$(CC)' \
	CPPFLAGS='$(LDFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	ac_cv_linux_kernel_pppoe=yes \
	ac_cv_path_PPPD=$(ROOTFS)$(prefix)/sbin/pppd \
	ac_cv_pppd_version=2.4.4 \
	rpppoe_cv_pack_bitfields=normal

package-configure:
	cd $(pkgtree)/src && \
		$(env) ./configure $(conf-args) $(conf-vars)

package-build:
	cd $(pkgtree)/src && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-do-install:
	cd $(pkgtree)/src && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles =
stripfiles = \
	$(prefix)/sbin/pppoe \
	$(prefix)/sbin/pppoe-relay \
	$(prefix)/sbin/pppoe-server \
	$(prefix)/sbin/pppoe-sniff

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

