PACKAGE = admp
VERSION = git

SOURCE_DIR = $(srctree)/../avionic-design/admp.git

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))
LIBC := $(shell echo $(CONFIG_LIBC))

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args += \
	--host=$(TARGET) \
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
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) $(SOURCE_DIR)/configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles =
stripfiles = \
	$(prefix)/bin/admp \
	$(prefix)/bin/admp-decode \
	$(prefix)/bin/admp-parse \
	$(prefix)/bin/admp-simple

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -l $(LIBC) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -l $(LIBC) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -l $(LIBC) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
