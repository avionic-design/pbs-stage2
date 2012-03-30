PACKAGE = webkit
VERSION = 1.8.0

LOCATION = http://www.webkitgtk.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

ACLOCAL_FLAGS += -I Source/autotools

conf-args += \
	--with-unicode-backend=glib \
	--disable-spellcheck \
	--disable-geolocation \
	--enable-page-visibility-api \
	--with-gtk=2.0

ifeq ($(CONFIG_ARCH),arm)
conf-args += \
	--disable-jit
endif

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_VIDEO),y)
conf-args += --disable-video
endif
ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_3D),y)
conf-args += \
	--enable-3d-rendering
# requires opengl
#	--enable-webgl
else
conf-args += \
	--disable-3d-rendering \
	--disable-webgl
endif
ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_FS_API),y)
conf-args += --enable-file-system
endif
ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_ANIM_API),y)
conf-args += --enable-animation-api
endif
ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_WEBKIT2),y)
# requires gtk3
conf-args += --enable-webkit2
endif


prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/* \
	$(prefix)/lib/*.so.*
