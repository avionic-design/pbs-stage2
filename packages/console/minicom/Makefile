PACKAGE = minicom
VERSION = 2.2

LOCATION = http://alioth.debian.org/download.php/1806
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = friendly menu-driven serial communication program

##############################################################################

include packages/autotools.mk

package-post-install:
	$(priv) $(INSTALL) -d $(ROOTFS)/etc/minicom
	$(priv) $(INSTALL) packages/$(package)/minirc.dfl $(ROOTFS)/etc/minicom

package-clean:
	@:

