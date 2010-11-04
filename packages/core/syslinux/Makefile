PACKAGE = syslinux
VERSION = 4.03

LOCATION = http://www.kernel.org/pub/linux/utils/boot/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	LD='$(LD)' \
	EXTRA_LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	MANDIR=$(prefix)/share/man \
	INSTALLROOT=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	/sbin/extlinux

include packages/cleanup.mk
include packages/binary.mk
