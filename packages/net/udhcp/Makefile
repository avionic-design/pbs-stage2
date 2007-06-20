PACKAGE = udhcp
VERSION = 0.9.8

LOCATION = http://udhcp.busybox.net/source
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

PATCHFILES = \
	$(DISTNAME)-compile-fixes.patch

include packages/common.mk
env = env -i

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS)

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
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

