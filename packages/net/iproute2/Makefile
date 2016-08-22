PACKAGE = iproute2
VERSION = 4.7.0
LICENSE = GPL

LOCATION = https://www.kernel.org/pub/linux/utils/net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/common.mk

stripfiles = \
	/sbin/bridge \
	/sbin/ctstat \
	/sbin/genl \
	/sbin/ifstat \
	/sbin/ip \
	/sbin/lnstat \
	/sbin/nstat \
	/sbin/rtacct \
	/sbin/rtmon \
	/sbin/rtstat \
	/sbin/ss

env += \
	CC='$(CC)' \
	CFLAGS='$(CPPFLAGS) $(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	DESTDIR='$(DESTDIR)'

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && $(env) ./configure
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) -j $(NUM_CPU)
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) -j $(NUM_CPU) install
	$(call cmd,stamp)

$(pkgtree)/.setup:
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
