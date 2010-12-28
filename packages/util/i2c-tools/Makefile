PACKAGE = i2c-tools
VERSION = 3.0.3

LOCATION = http://dl.lm-sensors.org/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp);

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	prefix="$(prefix)"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR="$(DESTDIR)" \
	prefix="$(prefix)"

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/sbin/i2cdetect \
	$(prefix)/sbin/i2cdump \
	$(prefix)/sbin/i2cget \
	$(prefix)/sbin/i2cset

include packages/cleanup.mk
include packages/binary.mk
