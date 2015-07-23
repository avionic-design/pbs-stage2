PACKAGE = cpufrequtils
VERSION = 008

LOCATION = https://www.kernel.org/pub/linux/utils/kernel/cpufreq
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CROSS=$(CROSS_COMPILE)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && $(priv) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	mandir=$(prefix)/share/man \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk

prunefiles =
stripfiles = \
	$(prefix)/bin/cpufreq-aperf \
	$(prefix)/bin/cpufreq-info \
	$(prefix)/bin/cpufreq-set \
	$(prefix)/lib/*.so.*
