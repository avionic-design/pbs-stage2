PACKAGE = lm_sensors
VERSION = 3.3.4
LICENSE = GPL LGPL

LOCATION = http://dl.lm-sensors.org/lm-sensors/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	EXLDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR='$(DESTDIR)' \
	PREFIX='$(prefix)' \
	MANDIR='$(prefix)/share/man'

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/sensors \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/isadump \
	$(prefix)/sbin/isaset

include packages/cleanup.mk
include packages/binary.mk
