PACKAGE = kbd
VERSION = 2.0.4
LICENSE = GPL

LOCATION = https://www.kernel.org/pub/linux/utils/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	$(prefix)/bin/chvt \
	$(prefix)/bin/deallocvt \
	$(prefix)/bin/dumpkeys \
	$(prefix)/bin/fgconsole \
	$(prefix)/bin/getkeycodes \
	$(prefix)/bin/kbdinfo \
	$(prefix)/bin/kbd_mode \
	$(prefix)/bin/kbdrate \
	$(prefix)/bin/loadkeys \
	$(prefix)/bin/loadunimap \
	$(prefix)/bin/mapscrn \
	$(prefix)/bin/openvt \
	$(prefix)/bin/psfxtable \
	$(prefix)/bin/resizecons \
	$(prefix)/bin/setfont \
	$(prefix)/bin/setkeycodes \
	$(prefix)/bin/setleds \
	$(prefix)/bin/setmetamode \
	$(prefix)/bin/setvtrgb \
	$(prefix)/bin/showconsolefont \
	$(prefix)/bin/showkey \
	$(prefix)/bin/vlock
