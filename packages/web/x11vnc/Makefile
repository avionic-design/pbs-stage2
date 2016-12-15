PACKAGE = x11vnc
VERSION = 0.9.13

LOCATION = https://github.com/LibVNC/$(PACKAGE)/archive
TARBALLS = $(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--with-system-libvncserver

stripfiles = \
	$(prefix)/bin/x11vnc
