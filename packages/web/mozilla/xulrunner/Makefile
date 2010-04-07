PACKAGE = xulrunner
VERSION = 1.9.2

LOCATION = ftp://ftp.mozilla.org/pub/mozilla.org/$(PACKAGE)/releases/$(VERSION)/source
TARBALLS = $(PACKAGE)-$(VERSION).source.tar.bz2

include packages/common.mk

pkgbuildtree = $(pkgtree)/mozilla-$(VERSION)

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
	--enable-application=xulrunner \
	--disable-crashreporter \
	--disable-javaxpcom \
	--disable-necko-wifi \
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
	$(call cmd,stamp)

sdkdir = $(prefix)/lib/xulrunner-devel-$(VERSION)/sdk

stripfiles = \
	$(sdkdir)/lib/libmozjs.so \
	$(sdkdir)/lib/libnspr4.so \
	$(sdkdir)/lib/libplc4.so \
	$(sdkdir)/lib/libplds4.so \
	$(sdkdir)/lib/libxpcom.so \
	$(sdkdir)/lib/libxul.so

include packages/cleanup.mk
include packages/binary.mk
