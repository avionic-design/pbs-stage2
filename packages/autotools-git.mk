ifndef GITTREE
$(error GITTREE is undefined)
endif

include packages/common.mk

HOST_GNU_TYPE = $(shell $(srctree)/support/config.sub $(TARGET))
BUILD_GNU_TYPE = $(shell $(srctree)/support/config.guess)

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args += \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
			$(env) $(GITTREE)/autogen.sh $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(HOST_GNU_TYPE) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
