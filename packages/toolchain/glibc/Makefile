include packages/toolchain/glibc/Makefile.location
include packages/toolchain/common.mk

prefix := /usr

$(pkgtree)/.setup:
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
	libc_cv_c_cleanup=yes \
	libc_cv_ssp=no

conf-vars += \
	ac_cv_lib_cap_cap_init=no

ifeq ($(CONFIG_ARCH),x86)
  ifeq ($(CONFIG_CPU),i686)
    conf-vars += CFLAGS='-march=i686 -O2 -g'
  endif

  ifeq ($(CONFIG_CPU),i786)
    conf-vars += CFLAGS='-march=prescott -O2 -g'
  endif
endif

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	-j $(NUM_CPU) \
	MAKEFLAGS=

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args) all
	$(call cmd,stamp)

install-args = \
	install_root=$(sysroot)

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
