PACKAGE = l4t-t20

ifeq ($(CONFIG_ARCH_ARM_FLOAT_ABI_HARDFP),y)
VERSION = r16.3-hfp
else
VERSION = r15.2-sfp
endif

LOCATION = http://ftp.avionic-design.de/pub/nvidia
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
