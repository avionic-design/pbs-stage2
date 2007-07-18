PACKAGE = base
VERSION = 000

dirs = \
	/bin \
	/dev \
	/etc \
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
	cp -a packages/$(package)/src/bin/* $(ROOTFS)/bin
	cp -a packages/$(package)/src/etc/* $(ROOTFS)/etc
	cp -a packages/$(package)/src/lib/* $(ROOTFS)/lib

$(rootfs-dirs):
	$(call cmd,mkdir_p)

