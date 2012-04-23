PACKAGE = webkit
VERSION = 1.8.0
LICENSE = LGPL BSD

LOCATION = http://www.webkitgtk.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

ACLOCAL_FLAGS += -I Source/autotools
# A bug in GNU make seems to cause parallel builds of this package to
# fail. See https://bugs.webkit.org/show_bug.cgi?id=79498
NUM_CPU := 1

conf-args += \
	--enable-page-visibility-api \
	--disable-geolocation \
	--disable-spellcheck \
	--with-gtk=2.0

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

ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_ACCELERATED_COMPOSITING),y)
  conf-args += --with-accelerated-compositing=cairo
else
  conf-args += --without-accelerated-compositing
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
  conf-args += --disable-webkit2
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
	$(prefix)/lib/*.so.*
