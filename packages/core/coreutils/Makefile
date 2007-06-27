PACKAGE = coreutils
VERSION = 6.9

LOCATION = http://ftp.gnu.org/gnu/coreutils
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

ac-cache = \
	fu_cv_sys_stat_statvfs=yes

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS) \
	$(ac-cache)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

