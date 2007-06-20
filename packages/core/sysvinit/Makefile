PACKAGE = sysvinit
VERSION = 2.86

LOCATION = ftp://ftp.cistron.nl/pub/people/miquels/sysvinit
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

CFLAGS += -D_GNU_SOURCE

env  = env -i
priv = sudo

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS)

package-build:
	cd $(pkgtree)/src && $(env) $(MAKE) $(build-args)

install-args = \
	ROOT=$(ROOTFS)

package-install:
	mkdir -p $(ROOTFS)/usr/share/man/man{1,5,8}
	cd $(pkgtree)/src && $(priv) $(env) $(MAKE) $(install-args) install
#	ln -sf sbin/init $(ROOTFS)/init

