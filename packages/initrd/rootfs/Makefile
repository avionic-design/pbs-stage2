PACKAGE = rootfs
VERSION = 0.0.1

LOCATION =
TARBALLS =

DESCRIPTION = base root filesystem

##############################################################################

include packages/common.mk

package-install: $(stampdir)/initrd/rootfs/package-install
$(stampdir)/initrd/rootfs/package-install:
	$(priv) cp -a packages/initrd/rootfs/src/* $(ROOTFS)
	$(makestamp)

SOURCE_FILES = \
	/init \
	/scripts/functions

TARGET_FILES = $(addprefix $(ROOTFS)/initrd, $(SOURCE_FILES))

$(ROOTFS)/initrd/%: $(SOURCE_FILES)

