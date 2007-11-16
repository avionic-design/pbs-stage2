PACKAGE = base
VERSION = 000

DESCRIPTION = base system files

##############################################################################

include packages/common.mk

dirs = \
	/bin \
	/dev \
	/etc/default \
	/etc/init.d \
	/etc/rc0.d \
	/etc/rc1.d \
	/etc/rc2.d \
	/etc/rc3.d \
	/etc/rc4.d \
	/etc/rc5.d \
	/etc/rc6.d \
	/etc/rcS.d \
	/lib \
	/media \
	/mnt \
	/proc \
	/root \
	/sys

rootfs-dirs = $(addprefix $(ROOTFS), $(dirs))

package-configure:

package-build:

package-install: $(rootfs-dirs)
	tar cf - -C packages/$(package)/src \
		bin etc lib sbin | \
	$(priv) tar oxf - -C $(ROOTFS)
#	$(priv) $(INSTALL) -o root -g root packages/$(package)/src/bin/* $(ROOTFS)/bin
#	$(priv) $(INSTALL) -o root -g root packages/$(package)/src/etc/* $(ROOTFS)/etc
#	$(priv) $(INSTALL) -o root -g root packages/$(package)/src/lib/* $(ROOTFS)/lib

$(rootfs-dirs):
	$(call cmd,priv_mkdir_p)

package-clean:
	@:

