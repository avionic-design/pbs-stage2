PACKAGE = glibc
VERSION = $(glibc_VERSION)

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE)-$(VERSION).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

##############################################################################

include toolchains/packages/common.mk

prefix		:= $(subst $(CURDIR),,$(prefix))
SYSROOT		:= $(CURDIR)
exec-prefix	:= $(prefix)/$(TARGET)
sysroot		:= $(exec-prefix)/sys-root

$(pkgtree)/.setup:
	cd $(pkgbuildtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--build=$(BUILD) \
	--prefix=$(sysroot)$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--program-prefix=$(TARGET)- \
	--with-headers=$(SYSROOT)$(sysroot)/usr/include \
	--enable-addons=ports

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

conf-vars += \
	ac_cv_lib_cap_cap_init=no

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
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
		$(priv) $(env) $(MAKE) $(install-args) install-headers
	cp $(pkgbuildtree)/obj-$(TARGET)/bits/stdio_lim.h \
		$(SYSROOT)$(sysroot)/usr/include/bits
	touch $(SYSROOT)$(sysroot)/usr/include/gnu/stubs.h
	$(call cmd,stamp)
