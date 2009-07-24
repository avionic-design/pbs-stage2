PACKAGE = glibc
VERSION = $(glibc_VERSION)

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE)-$(VERSION).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

##############################################################################

include toolchains/packages/common.mk

CROSS_COMPILE	:= $(SYSROOT)$(prefix)/bin/$(TARGET)-
prefix		:= $(subst $(CURDIR),,$(prefix))
SYSROOT		:= $(CURDIR)$(prefix)/$(TARGET)/sys-root

$(pkgtree)/.setup:
	cd $(pkgbuildtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--build=$(BUILD) \
	--prefix=$(prefix) \
	--datadir=$(prefix)/share \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--program-prefix=$(TARGET)- \
	--with-headers=$(SYSROOT)/usr/include \
	--enable-addons=ports

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

conf-vars += \
	ac_cv_lib_cap_cap_init=no

ifeq ($(ARCH),x86)
  ifeq ($(CPU),i686)
	conf-vars += CFLAGS='-march=i686 -O2 -g'
  endif

  ifeq ($(CPU),i786)
	conf-vars += CFLAGS='-march=prescott -O2 -g'
  endif
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

ifneq ($(SYSROOT),)
  install-args = \
	install_root=$(SYSROOT)
endif

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
