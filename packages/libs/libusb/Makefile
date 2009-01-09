PACKAGE = libusb
VERSION = 0.1.12

LOCATION = http://prdownloads.sourceforge.net/libusb
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-vars += \
	CC='$(CC) --sysroot $(ROOTFS)' \
	CXX='$(CXX) --sysroot $(ROOTFS)'

package-pre-configure:
	cp support/config.{guess,sub} $(pkgtree)

prunefiles = \
	$(prefix)/lib/libusb.la \
	$(prefix)/lib/libusbpp.la

sover = 4.4.4

stripfiles = \
	$(prefix)/lib/libusb-0.1.so.$(sover) \
	$(prefix)/lib/libusbpp-0.1.so.$(sover)

include packages/cleanup.mk

package-post-install: package-cleanup
	@:

package-clean:
	@:

