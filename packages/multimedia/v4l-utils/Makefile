PACKAGE = v4l-utils
VERSION = 0.8.8
LICENSE = LGPL

LOCATION = http://linuxtv.org/downloads/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	SYSROOT="$(SYSROOT)" \
	PREFIX="$(prefix)" \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	PREFIX=$(prefix) \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk

stripfiles = \
	$(prefix)/bin/cx18-ctl \
	$(prefix)/bin/decode_tm6000 \
	$(prefix)/bin/ir-keytable \
	$(prefix)/bin/ivtv-ctl \
	$(prefix)/bin/v4l2-compliance \
	$(prefix)/bin/v4l2-ctl \
	$(prefix)/bin/v4l2-sysfs-path \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/libv4l/ov511-decomp \
	$(prefix)/lib/libv4l/ov518-decomp \
	$(prefix)/lib/libv4l/v4l1compat.so \
	$(prefix)/lib/libv4l/v4l2convert.so \
	$(prefix)/sbin/v4l2-dbg
