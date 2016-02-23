PACKAGE = ca-certificates
VERSION = 20160104
LICENSE = GPLv2+ (script), MPLv2.0 (data)

LOCATION = http://http.debian.net/debian/pool/main/c/$(PACKAGE)
TARBALLS = $(PACKAGE)_$(VERSION).tar.xz

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) all
	$(call cmd,stamp)

install-vars = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(INSTALL) -d -m 0755 $(DESTDIR)$(prefix)/sbin \
			$(DESTDIR)$(prefix)/share/ca-certificates \
			$(DESTDIR)/etc/ssl/certs && \
		$(env) $(priv) $(MAKE) $(install-vars) install && \
		for i in `find $(DESTDIR)$(prefix)/share/ca-certificates -name "*.crt"` ; do \
			$(priv) ln -rsf $$i $(DESTDIR)/etc/ssl/certs/`basename $${i} .crt`.pem ;\
			cat $$i >>$(DESTDIR)/etc/ssl/certs/ca-certificates.crt ;\
		done
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
