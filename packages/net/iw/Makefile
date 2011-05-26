PACKAGE = iw
VERSION = 0.9.22

LOCATION = http://wireless.kernel.org/download/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

#pkgbuildtree := $(pkgtree)/$(subst -,_,$(PACKAGE)).$(VERSION)

env += \
	PKG_CONFIG_LIBDIR=$(SYSROOT)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(SYSROOT)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' V=1 \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	INSTALL_MAN=$(DESTDIR)$(prefix)/share/man \
	PREFIX=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/iw \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
