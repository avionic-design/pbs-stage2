PACKAGE = libcap
VERSION = 2.22

LOCATION = http://www.kernel.org/pub/linux/libs/security/linux-privs/$(PACKAGE)2
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	prefix=$(prefix) \
	lib=lib \
	BUILD_CC='gcc' \
	CC='$(CC)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	EXTRA_LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	prefix=$(prefix) \
	lib=lib \
	RAISE_SETFCAP=no \
	DESTDIR='$(DESTDIR)'

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/capsh \
	$(prefix)/sbin/setcap \
	$(prefix)/sbin/getcap \
	$(prefix)/sbin/getpcaps

include packages/cleanup.mk
include packages/binary.mk
