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

include toolchains/packages/common.mk
exec-prefix = $(prefix)/$(TARGET)
sysroot = $(exec-prefix)/sys-root

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--libdir=$(sysroot)/usr/lib \
	--libexecdir=$(sysroot)/usr/lib \
	--includedir=$(sysroot)/usr/include \
	--program-prefix=$(TARGET)- \
	--with-mpfr=$(SYSROOT)$(prefix) \
	--with-gmp=$(SYSROOT)$(prefix) \
	--disable-libmudflap \
	--disable-libssp \
	--disable-shared \
	--disable-threads \
	--disable-nls \
	--enable-symvers=gnu \
	--enable-languages=c

conf-args += \
	--with-as=$(SYSROOT)$(prefix)/bin/$(TARGET)-as \
	--with-ld=$(SYSROOT)$(prefix)/bin/$(TARGET)-ld \
	--with-sysroot=yes

ifeq ($(FLOAT),soft)
  conf-args += --with-float=soft
endif

ifneq ($(findstring multilib,$(variant)),)
  conf-args += --enable-multilib
else
  conf-args += --disable-multilib
endif

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(HOST) && \
		cd $(pkgbuildtree)/obj-$(HOST) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	-j $(NUM_CPU) \
	MAKEFLAGS=

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args) all-gcc
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args) all-target-libgcc
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

ifneq ($(SYSROOT),)
  CC = $(SYSROOT)$(prefix)/bin/$(TARGET)-gcc
  install-args = \
	DESTDIR=$(SYSROOT)
else
  CC = $(prefix)/bin/$(TARGET)-gcc
endif

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(priv) $(MAKE) $(install-args) install-gcc
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(priv) $(MAKE) $(install-args) install-target-libgcc
	# link missing fixed headers
	$(priv) ln -sf ../include-fixed/limits.h \
		`$(CC) -print-file-name=include`/limits.h
	$(call cmd,stamp)
