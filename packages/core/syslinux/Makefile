PACKAGE = syslinux
VERSION = 4.03

LOCATION = http://www.kernel.org/pub/linux/utils/boot/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && rm -f MCONFIG.local && \
		echo 'CC = $(CC)' >> MCONFIG.local && \
		echo 'EXTRA_CFLAGS = $(CFLAGS)' >> MCONFIG.local && \
		echo 'LD = $(LD)' >> MCONFIG.local && \
		echo 'EXTRA_LDFLAGS = $(LDFLAGS)' >> MCONFIG.local && \
		echo 'HOST_CC = gcc' >> MCONFIG.local && \
		echo 'HOST_CFLAGS = -O2 -g' >> MCONFIG.local && \
		echo 'HOST_LD = gcc' >> MCONFIG.local && \
		echo 'HOST_LDFLAGS =' >> MCONFIG.local
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	MANDIR=$(prefix)/share/man \
	SBINDIR=$(prefix)/sbin \
	INSTALLROOT=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/syslinux \
	$(prefix)/sbin/extlinux

include packages/cleanup.mk
include packages/binary.mk
