PACKAGE = udev
VERSION = 106

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/hotplug
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include packages/common.mk

EXTRAS = \
	extras/path_id \
	extras/run_directory \
	extras/volume_id

build-args = \
	prefix=/ \
	$(call set-args, CROSS_COMPILE OPTFLAGS LDFLAGS EXTRAS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS) \
	prefix=/ \
	EXTRAS='$(EXTRAS)'

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

