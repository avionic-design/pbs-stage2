PACKAGE = gcc
VERSION = 4.5.0

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)/$(PACKAGE)-$(VERSION)
TARBALLS = $(PACKAGE)-core-$(VERSION).tar.bz2

include packages/toolchain/common.mk
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
	--with-pkgversion="PBS $(subst $(quote),,$(CONFIG_VERSION))" \
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

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(HOST) && \
		cd $(pkgbuildtree)/obj-$(HOST) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	-j $(NUM_CPU) \
	MAKEFLAGS=

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args) all-gcc
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args) all-target-libgcc
	$(call cmd,stamp)

ifneq ($(SYSROOT),)
  CC = $(SYSROOT)$(prefix)/bin/$(TARGET)-gcc
  install-args = \
	DESTDIR=$(SYSROOT)
else
  CC = $(prefix)/bin/$(TARGET)-gcc
endif

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(priv) $(MAKE) $(install-args) install-gcc
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(priv) $(MAKE) $(install-args) install-target-libgcc
	# install wrapper script
	rm $(CC) && \
		sed -e 's,@VERSION@,$(VERSION),' $(pkgsrctree)/gcc.wrapper \
			> $(CC) && \
		chmod a+x $(CC)
	# link missing fixed headers
	$(priv) ln -sf ../include-fixed/limits.h \
		`$(CC) -print-file-name=include`/limits.h
	$(call cmd,stamp)
