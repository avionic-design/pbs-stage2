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

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--libdir=$(exec-prefix)/lib \
	--disable-nls

ifneq ($(findstring sysroot,$(variant)),)
  conf-args += \
	--with-sysroot=$(PLATFORM)
endif

ifneq ($(findstring multilib,$(variant)),)
  conf-args += \
	--enable-multilib
else
  conf-args += \
	--disable-multilib
endif

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

ifneq ($(ROOTFS),)
  install-args = \
	DESTDIR=$(ROOTFS)
endif

package-install:
	cd $(pkgtree) && $(env) $(priv) $(MAKE) $(install-args) install

package-clean:
	@:

