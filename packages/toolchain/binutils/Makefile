PACKAGE = binutils
VERSION = 2.17

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/toolchain/common.mk

conf-args = \
	--with-sysroot=$(PLATFORM) \
	--disable-nls

package-configure:
	cd $(pkgtree) && $(env) ./configure --target=$(HOST) --host=$(BUILD) \
		--prefix=/usr --mandir=/usr/share/man $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = DESTDIR=$(PLATFORM)
package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

