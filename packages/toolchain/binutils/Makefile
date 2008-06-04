PACKAGE = binutils

ifeq ($(BINUTILS_VERSION),snapshot)
  BINUTILS_VERSION = $(BINUTILS_SNAPSHOT)
  LOCATION = http://kernel.org/pub/linux/devel/binutils
else
  LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
endif

VERSION  = $(BINUTILS_VERSION)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/toolchain/common.mk

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info

ifeq ($(variant),sysroot)
  conf-args += \
	--with-sysroot=$(PLATFORM)
#	--enable-multilib \
#	--disable-nls
endif

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

ifeq ($(variant),sysroot)
  install-args = DESTDIR=$(PLATFORM)
endif

package-install:
	cd $(pkgtree) && $(env) $(priv) $(MAKE) $(install-args) install

package-clean:
	@:

