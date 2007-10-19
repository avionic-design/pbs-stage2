PACKAGE = glibc
VERSION = 2.6.1

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

##############################################################################

ifdef ARCH
  ifneq ($(wildcard packages/$(package)/patches/$(ARCH)/series),)
    patchdir = packages/$(package)/patches/$(ARCH)
  endif
endif

include packages/buildroot/toolchain/autotools.mk
include packages/buildroot/toolchain/glibc/Makefile.$(ARCH)

env = env -i PATH=$(ROOTFS)$(prefix)/bin:${PATH}

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

conf-args += \
	--with-binutils=$(ROOTFS)$(prefix)/bin \
	--with-headers=$(ROOTFS)$(prefix)/include \
	--disable-profile \
	--enable-add-ons \
	--without-gd \
	--without-selinux

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

install-vars += \
	install_root=$(ROOTFS)

package-pre-install:
	mkdir -p $(ROOTFS)$(prefix)/etc
	touch $(ROOTFS)$(prefix)/etc/ld.so.conf

package-clean:
	@:

