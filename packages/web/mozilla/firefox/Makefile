PACKAGE = firefox
VERSION = 3.5.6

LOCATION = ftp://ftp.mozilla.org/pub/mozilla.org/$(PACKAGE)/releases/$(VERSION)/source
TARBALLS = $(PACKAGE)-$(VERSION).source.tar.bz2

include packages/common.mk

GECKO_VERSION = 1.9.1
pkgbuildtree = $(pkgtree)/mozilla-$(GECKO_VERSION)

ARCH := $(shell echo $(CONFIG_ARCH))
LIBC := $(shell echo $(CONFIG_LIBC))

env += \
	CROSS_COMPILE=1 \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS) \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" \
	CXXFLAGS="$(CXXFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	HOST_CFLAGS="-O2 -g" \
	HOST_CXXFLAGS="-O2 -g" \
	HOST_LDFLAGS="-O2 -g"

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-args += \
	--enable-application=browser \
	--disable-crashreporter \
	--disable-ogg

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
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
	$(priv) mv $(DESTDIR)$(prefix)/include/firefox-$(VERSION) \
		$(DESTDIR)$(prefix)/include/firefox
	$(priv) mv $(DESTDIR)$(prefix)/lib/firefox-$(VERSION) \
		$(DESTDIR)$(prefix)/lib/firefox
	$(priv) mv $(DESTDIR)$(prefix)/lib/firefox-devel-$(VERSION) \
		$(DESTDIR)$(prefix)/lib/firefox-devel
	$(priv) mv $(DESTDIR)$(prefix)/share/idl/firefox-$(VERSION) \
		$(DESTDIR)$(prefix)/share/idl/firefox
	$(call cmd,stamp)

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
