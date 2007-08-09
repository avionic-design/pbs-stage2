PACKAGE = udev
VERSION = 113

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = /dev and hotplug management daemon

##############################################################################

include packages/common.mk

EXTRAS = \
	extras/path_id \
	extras/volume_id

build-args = \
	$(call set-args, CROSS_COMPILE OPTFLAGS LDFLAGS EXTRAS)
#	prefix=/ \

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS) \
	$(call set-args, EXTRAS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) mkdir -p $(ROOTFS)/etc/udev/rules.d
	$(priv) cp -a $(pkgtree)/etc/udev/rules.d/* $(ROOTFS)/etc/udev/rules.d
	# install package configuration files
	$(priv) cp packages/$(package)/udev.rules $(ROOTFS)/etc/udev/rules.d
	$(priv) cp packages/$(package)/udev.init $(ROOTFS)/etc/init.d/udev
	$(priv) ln -s ../init.d/udev $(ROOTFS)/etc/rcS.d/S03udev

