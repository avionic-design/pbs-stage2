PACKAGE = gcc

ifeq ($(GCC_VERSION),snapshot)
  VERSION  = $(GCC_SNAPSHOT)
  CONFIG   = snapshot
  LOCATION = ftp://gcc.gnu.org/pub/$(PACKAGE)/snapshots/$(VERSION)
else
  VERSION  = $(GCC_VERSION)
  CONFIG   = $(VERSION)
  LOCATION = ftp://ftp.gwdg.de/pub/misc/gcc/releases/$(PACKAGE)-$(VERSION)
endif

TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk
exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--libexecdir=$(exec-prefix)/lib \
	--includedir=$(exec-prefix)/include \
	--program-prefix=$(TARGET)- \
	--with-mpfr=$(ROOTFS)$(prefix) \
	--with-gmp=$(ROOTFS)$(prefix) \
	--disable-libmudflap \
	--disable-libssp \
	--disable-shared \
	--disable-threads \
	--disable-nls \
	--enable-symvers=gnu \
	--enable-languages=c

ifneq ($(findstring sysroot,$(variant)),)
  conf-args += \
	--with-local-prefix=$(ROOTFS) \
	--with-build-sysroot=$(ROOTFS) \
	--with-sysroot=$(ROOTFS) \
	--with-as=$(ROOTFS)$(prefix)/bin/$(TARGET)-as \
	--with-ld=$(ROOTFS)$(prefix)/bin/$(TARGET)-ld
else
  conf-args += \
	--with-local-prefix=$(prefix)
endif

ifeq ($(FLOAT),soft)
  conf-args += --with-float=soft
endif

ifneq ($(findstring multilib,$(variant)),)
  conf-args += --enable-multilib
else
  conf-args += --disable-multilib
endif

package-configure:
	mkdir -p $(pkgtree)/obj-$(HOST) && \
		cd $(pkgtree)/obj-$(HOST) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	MAKEFLAGS=

package-build:
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args) all-gcc
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args) all-target-libgcc

ifneq ($(ROOTFS),)
  CC           = $(ROOTFS)$(prefix)/bin/$(TARGET)-gcc
  install-args = DESTDIR=$(ROOTFS)
else
  CC           = $(prefix)/bin/$(TARGET)-gcc
endif

package-install:
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) $(priv) $(MAKE) $(install-args) install-gcc
	cd $(pkgtree)/obj-$(HOST) && \
		$(env) $(priv) $(MAKE) $(install-args) install-target-libgcc
	# link missing fixed headers
	$(priv) ln -sf ../include-fixed/limits.h \
		`$(CC) -print-file-name=include`/limits.h

package-clean:
	@:

