PACKAGE = LibVNCServer
VERSION = 0.9.9
LICENSE = GPL

LOCATION = https://github.com/LibVNC/libvncserver/archive
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

pkgbuildtree := $(pkgtree)/libvncserver-$(PACKAGE)-$(VERSION)

include packages/autotools-reconf.mk

conf-args += \
	--with-libgcrypt-prefix=$(SYSROOT)$(prefix)

prunefiles = \
	$(prefix)/bin/libvncserver-config \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/linuxvnc \
	$(prefix)/lib/*.so.*
