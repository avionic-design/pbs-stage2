PACKAGE = DirectFB
VERSION = 1.0.0

LOCATION = http://www.directfb.org/downloads/Core
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

# FIXME: this is sick, libtool doesn't forward the --sysroot parameter
#        otherwise
CC += --sysroot $(ROOTFS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	ac_cv_header_asm_page_h=no \
	$(call set-args, CC CFLAGS LD LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

