PACKAGE = cpufrequtils
VERSION = 007

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/cpufreq
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

build-args = \
	CROSS=$(CROSS_COMPILE)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	mandir=$(prefix)/share/man \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk

prunefiles =
stripfiles = \
	$(prefix)/bin/cpufreq-aperf \
	$(prefix)/bin/cpufreq-info \
	$(prefix)/bin/cpufreq-set \
	$(prefix)/lib/libcpufreq.so.0.0.0
