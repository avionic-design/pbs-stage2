PACKAGE = webkit
VERSION = 1.4.2

LOCATION = http://www.webkitgtk.org
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-unicode-backend=glib \
	--disable-spellcheck

ifneq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_VIDEO),y)
conf-args += --disable-video
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/* \
	$(prefix)/lib/*.so.*
