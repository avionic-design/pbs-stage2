PACKAGE = rootfs
VERSION = 000

LOCATION =
TARBALLS =

DESCRIPTION = base root filesystem

##############################################################################

include packages/common.mk

package-install: $(stampdir)/initrd/rootfs/package-install
$(stampdir)/initrd/rootfs/package-install:
	$(priv) cp -a packages/$(package)/src/* $(ROOTFS)
	$(makestamp)

package-clean:
	@:

