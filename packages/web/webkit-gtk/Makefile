PACKAGE = webkitgtk
VERSION = 1.10.0
LICENSE = LGPL BSD

LOCATION = http://www.webkitgtk.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

ACLOCAL_FLAGS += -I Source/autotools

conf-args += \
	--libexecdir=$(prefix)/lib/webkit \
	--enable-page-visibility-api \
	--disable-silent-rules \
	--disable-geolocation \
	--disable-spellcheck

ifeq ($(CONFIG_ARCH),arm)
conf-args += \
	--disable-jit
endif

ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_UNICODE_BACKEND_ICU),y)
  conf-args += --with-unicode-backend=icu
else
  conf-args += --with-unicode-backend=glib
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_VIDEO),y)
  conf-args += --disable-video
else
  conf-args += --enable-video
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_ACCELERATED_COMPOSITING),y)
  conf-args += \
	--disable-accelerated-compositing \
	--with-acceleration-backend=none
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_WEBGL),y)
  conf-args += --disable-webgl
else
  conf-args += --enable-webgl
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_FS_API),y)
  conf-args += --disable-file-system
else
  conf-args += --enable-file-system
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_ANIM_API),y)
  conf-args += --disable-animation-api
else
  conf-args += --enable-animation-api
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_WEBKIT2),y)
  conf-args += \
	--disable-webkit2 \
	--with-gtk=2.0
else
  # requires gtk3
  conf-args += \
	--enable-webkit2 \
	--with-gtk=3.0
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/* \
	$(prefix)/lib/$(PACKAGE)/WebKitPluginProcess \
	$(prefix)/lib/$(PACKAGE)/WebKitWebProcess \
	$(prefix)/lib/*.so.*
