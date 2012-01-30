PACKAGE = pciutils
VERSION = 3.1.9

LOCATION = http://www.kernel.org/pub/software/utils/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	PREFIX=$(prefix) \
	CROSS_COMPILE='$(CROSS_COMPILE)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	HOST='$(TARGET)' \
	SHARED=yes \
	ZLIB=yes \
	DNS=no

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	PREFIX=$(prefix) \
	IDSDIR=$(prefix)/share/hwdata \
	MANDIR=$(prefix)/share/man \
	DESTDIR=$(DESTDIR) \
	SHARED=yes

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install install-lib
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/lspci \
	$(prefix)/sbin/setpci

include packages/cleanup.mk
include packages/binary.mk
