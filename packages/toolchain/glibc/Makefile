PACKAGE = glibc
VERSION = $(glibc_VERSION)

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE)-$(VERSION).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk

$(pkgtree)/.extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	$(call cmd,stamp)

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	--host=$(TARGET) \
	--build=$(BUILD) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--includedir=$(exec-prefix)/include \
	--infodir=$(exec-prefix)/share/info \
	--libdir=$(exec-prefix)/lib \
	--libexecdir=$(exec-prefix)/lib \
	--mandir=$(exec-prefix)/share/man \
	--program-prefix=$(TARGET)- \
	--with-headers=$(ROOTFS)$(exec-prefix)/include \
	--enable-addons=ports

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

#conf-vars += \
	ac_cv_lib_cap_cap_init=no \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	libc_cv_$(ARCH)_tls=yes

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

conf-vars += \
	ac_cv_lib_cap_cap_init=no

ifeq ($(ARCH),i686)
	conf-vars += CFLAGS='-march=i686 -O2 -g'
endif

ifeq ($(ARCH),i786)
	conf-vars += CFLAGS='-march=prescott -O2 -g'
endif

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	MAKEFLAGS=

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args) all
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

ifeq ($(ROOTFS),)
  install-args = \
	install_root=$(ROOTFS)
endif

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
