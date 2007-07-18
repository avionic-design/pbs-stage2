PACKAGE = glib
VERSION = 2.12.12

LOCATION = ftp://ftp.gtk.org/pub/glib/2.12
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

env += sysroot=$(ROOTFS)
CC  += --sysroot $(ROOTFS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS LD LDFLAGS) \
	glib_cv_stack_grows=yes \
	glib_cv_uscore=no \
	ac_cv_func_posix_getpwuid_r=yes

package-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

