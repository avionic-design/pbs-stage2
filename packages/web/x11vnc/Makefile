PACKAGE = x11vnc
VERSION = 0.9.13

LOCATION = http://prdownloads.sourceforge.net/libvncserver/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--with-system-libvncserver

stripfiles = \
	$(prefix)/bin/x11vnc
