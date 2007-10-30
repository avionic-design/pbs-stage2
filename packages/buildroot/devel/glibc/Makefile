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

include packages/buildroot/devel/autotools.mk
include packages/buildroot/devel/glibc/Makefile.$(ARCH)

env = env -i PATH=${PATH}

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

conf-args += \
	--with-headers=$(ROOTFS)$(prefix)/include \
	--enable-add-ons

install-args += \
	install_root=$(ROOTFS)

package-pre-install:
	mkdir -p $(ROOTFS)$(prefix)/etc
	touch $(ROOTFS)$(prefix)/etc/ld.so.conf

package-clean:
	@:

