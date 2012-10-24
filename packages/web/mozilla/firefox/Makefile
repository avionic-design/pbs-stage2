PACKAGE = firefox
VERSION = 3.6.12

LOCATION = ftp://ftp.mozilla.org/pub/mozilla.org/$(PACKAGE)/releases/$(VERSION)/source
TARBALLS = $(PACKAGE)-$(VERSION).source.tar.bz2

include packages/common.mk

GECKO_VERSION = 1.9.2
pkgbuildtree = $(pkgtree)/mozilla-$(GECKO_VERSION)

env += \
	CROSS_COMPILE=1 \
	PKG_CONFIG_LIBDIR=$(SYSROOT)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(SYSROOT) \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" \
	CXXFLAGS="$(CXXFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	HOST_CFLAGS="-O2 -g" \
	HOST_CXXFLAGS="-O2 -g" \
	HOST_LDFLAGS="-O2 -g -L$(BUILD_TOOLS)/lib"

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
	--disable-necko-wifi \
	--disable-ogg

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
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
	$(priv) ln -sf $(prefix)/lib/firefox/firefox \
		$(DESTDIR)$(prefix)/bin/firefox
	$(call cmd,stamp)

sdkdir = $(prefix)/lib/firefox-devel/sdk

stripfiles = \
	$(sdkdir)/lib/*.so

include packages/cleanup.mk
include packages/binary.mk
