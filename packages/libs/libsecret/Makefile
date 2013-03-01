PACKAGE = libsecret
VERSION = 0.12

LOCATION = http://ftp.gnome.org/pub/gnome/sources/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(sysroot) \
	--disable-gcrypt \
	--disable-gtk-doc \
	--disable-nls

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
