PACKAGE = LibVNCServer
VERSION = 0.9.9
LICENSE = GPL

LOCATION = http://prdownloads.sourceforge.net/libvncserver/libvncserver/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--with-libgcrypt-prefix=$(SYSROOT)$(prefix)

prunefiles = \
	$(prefix)/bin/libvncserver-config \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/linuxvnc \
	$(prefix)/lib/*.so.*
