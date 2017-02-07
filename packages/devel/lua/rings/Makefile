PACKAGE = rings
VERSION = 1.3.0
LICENSE = MIT

LOCATION = https://github.com/keplerproject/$(PACKAGE)/archive
TARBALLS = v_$(subst .,_,$(VERSION)).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

# If you're wondering: yes, that leading underscore is part of v1.3.0.
pkgbuildtree = $(pkgtree)/$(PACKAGE)-v_$(subst .,_,$(VERSION))

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args += \
        -j $(NUM_CPU) \
	PREFIX=/usr \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args += \
	PREFIX=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
