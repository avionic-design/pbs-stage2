PACKAGE = LibVNCServer
VERSION = 0.9.10
LICENSE = GPL

LOCATION = https://github.com/LibVNC/libvncserver/archive
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/libvncserver-$(PACKAGE)-$(VERSION)

include packages/autotools-reconf.mk

conf-args += \
	--with-libgcrypt-prefix=$(SYSROOT)$(prefix) \
	--without-libva

prunefiles = \
	$(prefix)/bin/libvncserver-config \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/linuxvnc \
	$(prefix)/lib/*.so.*
