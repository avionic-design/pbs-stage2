PACKAGE = gettext
VERSION = 0.16.1

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

CC += --sysroot $(ROOTFS)

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--disable-openmp \
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

