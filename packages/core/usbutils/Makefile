PACKAGE = usbutils
VERSION = 0.73

LOCATION = http://kent.dl.sourceforge.net/sourceforge/linux-usb
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = Linux USB utilities

##############################################################################

include packages/autotools.mk

stripfiles = \
	$(prefix)/sbin/lsusb

include packages/cleanup.mk

package-post-install: _cleanup
	@:

package-clean:
	@:

