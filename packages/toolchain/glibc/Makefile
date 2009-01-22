PACKAGE = glibc
VERSION = $(LIBC_VERSION)

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

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

conf-vars += \
	ac_cv_lib_cap_cap_init=no \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	libc_cv_$(ARCH)_tls=yes

ifeq ($(ARCH),i686)
	conf-vars += CFLAGS='-march=i686 -O2 -g'
endif

ifeq ($(ARCH),i786)
	conf-vars += CFLAGS='-march=prescott -O2 -g'
endif

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args = \
	MAKEFLAGS=

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args) all

ifeq ($(ROOTFS),)
  install-args = \
	install_root=$(ROOTFS)
endif

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install

package-clean:
	@:

