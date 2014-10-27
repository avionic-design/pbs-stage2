PACKAGE = dhcpcd
VERSION = 6.6.1
LICENSE = BSD

LOCATION = http://roy.marples.name/downloads/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(HOST_GNU_TYPE) \
	--build=$(HOST_BUILD_TYPE) \
	--prefix=$(prefix) \
	--libexecdir=$(prefix)/lib/$(PACKAGE) \
	--dbdir=/var/lib/dhcp \
	--sysconfdir=/etc \
	--without-udev

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/dhcpcd

include packages/cleanup.mk
include packages/binary.mk
