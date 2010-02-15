PACKAGE = icu4c
VERSION = 4.2.1

LOCATION = http://download.icu-project.org/files/icu4c/$(VERSION)
TARBALLS = $(PACKAGE)-$(subst .,_,$(VERSION))-src.tgz

include packages/common.mk

pkgbuildtree := $(pkgtree)/icu

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--sysconfdir=/etc

conf-args += \
	--with-cross-build=$(pkgbuildtree)/obj-$(HOST) \
	--disable-extras \
	--disable-samples \
	--disable-tests

conf-vars = \
	CFLAGS='$(CFLAGS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CXXFLAGS='$(CXXFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.prepare: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(HOST) && \
		cd $(pkgbuildtree)/obj-$(HOST) && \
			env -i PATH=${PATH} ../source/configure
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(MAKE) MAKEFLAGS= TARGET=
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.prepare
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../source/configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

sover = 42.1

stripfiles = \
	$(prefix)/bin/derb \
	$(prefix)/bin/genbrk \
	$(prefix)/bin/gencfu \
	$(prefix)/bin/gencnval \
	$(prefix)/bin/genctd \
	$(prefix)/bin/genrb \
	$(prefix)/bin/makeconv \
	$(prefix)/bin/pkgdata \
	$(prefix)/bin/uconv \
	$(prefix)/lib/libicutu.so.$(sover) \
	$(prefix)/lib/libiculx.so.$(sover) \
	$(prefix)/lib/libicui18n.so.$(sover) \
	$(prefix)/lib/libicuio.so.$(sover) \
	$(prefix)/lib/libicudata.so.$(sover) \
	$(prefix)/lib/libicule.so.$(sover) \
	$(prefix)/lib/libicuuc.so.$(sover) \
	$(prefix)/sbin/genccode \
	$(prefix)/sbin/gencmn \
	$(prefix)/sbin/gensprep \
	$(prefix)/sbin/genuca \
	$(prefix)/sbin/icupkg \
	$(prefix)/sbin/icuswap

include packages/cleanup.mk
include packages/binary.mk
