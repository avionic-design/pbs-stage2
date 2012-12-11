PACKAGE = syslinux
VERSION = 4.06
LICENSE = GPL

LOCATION = http://www.kernel.org/pub/linux/utils/boot/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree)/mk && rm -f local.mk && \
		echo 'CC = $(CC)' >> local.mk && \
		echo 'EXTRA_CFLAGS = $(CFLAGS)' >> local.mk && \
		echo 'LD = $(LD)' >> local.mk && \
		echo 'EXTRA_LDFLAGS = $(LDFLAGS)' >> local.mk && \
		echo 'HOST_CC = gcc' >> local.mk && \
		echo 'HOST_CFLAGS = -O2 -g' >> local.mk && \
		echo 'HOST_LD = gcc' >> local.mk && \
		echo 'HOST_LDFLAGS =' >> local.mk
	$(call cmd,stamp)

# syslinux' build system goes crazy if ARCH is defined. This should really
# only happen if it is set via the command-line. By overriding the special
# MAKEFLAGS variable, we make sure it is not passed to the syslinux build
# system.
build-args += \
	MAKEFLAGS=

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	MANDIR=$(prefix)/share/man \
	SBINDIR=$(prefix)/sbin \
	INSTALLROOT=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/gethostip \
	$(prefix)/bin/isohybrid \
	$(prefix)/bin/memdiskfind \
	$(prefix)/bin/syslinux \
	$(prefix)/sbin/extlinux

include packages/cleanup.mk
include packages/binary.mk
