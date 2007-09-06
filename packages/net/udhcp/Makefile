PACKAGE = udhcp
VERSION = 0.9.8

LOCATION = http://udhcp.busybox.net/source
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

LDFLAGS += --sysroot $(ROOTFS)
env      = env -i $(call set-args, CFLAGS LDFLAGS)

build-args = \
	$(call set-args, CROSS_COMPILE)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	prefix=$(ROOTFS)/usr \
	SBINDIR=$(ROOTFS)/sbin

package-install:
	# this is very screwed up
	mv $(pkgtree)/samples/sample.script $(pkgtree)/samples/default.script
	sed s/sample/default/ $(pkgtree)/samples/default.script \
		> $(pkgtree)/samples/sample.script
	rm $(pkgtree)/samples/default.script
	# install the package
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

