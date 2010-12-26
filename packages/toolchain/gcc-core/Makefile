include packages/toolchain/gcc/Makefile.location
include packages/toolchain/common.mk

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
	--with-pkgversion="PBS $(RELEASE)" \
	--program-prefix=$(TARGET)- \
	--with-mpfr=$(prefix) \
	--with-gmp=$(prefix) \
	--disable-libmudflap \
	--disable-multilib \
	--disable-libssp \
	--disable-shared \
	--disable-threads \
	--disable-nls \
	--enable-symvers=gnu \
	--enable-languages=c

conf-args += \
	--with-as=$(prefix)/bin/$(TARGET)-as \
	--with-ld=$(prefix)/bin/$(TARGET)-ld \
	--with-sysroot=yes

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

CC = $(prefix)/bin/$(TARGET)-gcc

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(install-args) install-gcc
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(install-args) install-target-libgcc
	# install wrapper script
	rm $(CC) && \
		sed -e 's,@VERSION@,$(VERSION),' $(pkgsrctree)/gcc.wrapper \
			> $(CC) && \
		chmod a+x $(CC)
	$(call cmd,stamp)
