PACKAGE = binutils
VERSION = 2.18

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/toolchain/common.mk

conf-args = \
	--prefix=/usr \
	--mandir=/usr/share/man \
	--infodir=/usr/share/info \
	--with-sysroot=$(PLATFORM) \
	--enable-multilib \
	--disable-nls

package-configure:
	cd $(pkgtree) && $(env) ./configure --target=$(HOST) \
		$(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = DESTDIR=$(PLATFORM)
package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

package-clean:
	@:

