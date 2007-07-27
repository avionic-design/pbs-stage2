PACKAGE = udev
VERSION = 113

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include packages/common.mk

env = env -i

EXTRAS = \
	extras/path_id \
	extras/volume_id

build-args = \
	prefix=/ \
	$(call set-args, CROSS_COMPILE EXTRAS)

ifeq ($(INITRD_VARIANT),klibc)
  env += LDFLAGS='-Wl,-nodefaultlibs -Wl,-s'
  build-args += \
	CC='$(PLATFORM)/tmp/bin/klcc -static' \
	LD='$(PLATFORM)/tmp/bin/klcc -static'
else
  build-args += $(call set-args, LDFLAGS)
endif

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS) \
	prefix=/ \
	EXTRAS='$(EXTRAS)'

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

