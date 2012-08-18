include packages/toolchain/glibc/Makefile.location
include packages/toolchain/common.mk

prefix := /usr

$(pkgtree)/.setup:
	cd $(pkgbuildtree) && \
		ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--build=$(BUILD) \
	--prefix=$(prefix) \
	--datadir=$(prefix)/share \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--program-prefix=$(TARGET)- \
	--with-headers=$(sysroot)$(prefix)/include \
	--enable-addons=ports

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

conf-vars += \
	ac_cv_lib_cap_cap_init=no

ifeq ($(CONFIG_ARCH),alpha)
  conf-vars += \
	libc_cv_mlong_double_128=yes
endif

ifeq ($(CONFIG_ARCH),powerpc)
  conf-vars += \
	libc_cv_mlong_double_128ibm=yes \
	libc_cv_mlong_double_128=yes \
	libc_cv_ppc_machine=yes \
	libc_cv_ppc_rel16=yes
endif

ifeq ($(CONFIG_ARCH),sparc)
  conf-vars += \
	libc_cv_mlong_double_128=yes
endif

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

install-args = \
	install_root=$(sysroot)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install-headers
	cp $(pkgbuildtree)/obj-$(TARGET)/bits/stdio_lim.h \
		$(sysroot)$(prefix)/include/bits
	touch $(sysroot)$(prefix)/include/gnu/stubs.h
	$(call cmd,stamp)
