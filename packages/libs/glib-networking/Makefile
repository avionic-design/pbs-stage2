PACKAGE = glib-networking
VERSION = 2.30.2

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(pkgbuildtree)/m4

conf-args += \
	--with-libgcrypt-prefix=$(SYSROOT)$(prefix) \
	--disable-static \
	--with-gnutls

plugin = $(prefix)/lib/gio/modules

prunefiles = \
	$(plugin)/*.la

#stripfiles = \
	$(plugin)/*.so
