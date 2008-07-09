PACKAGE = glibc
VERSION = $(LIBC_VERSION)

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk

env += \
	CC=gcc \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	libc_cv_$(ARCH)_tls=yes

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--includedir=$(exec-prefix)/include \
	--infodir=$(exec-prefix)/share/info \
	--libdir=$(exec-prefix)/lib \
	--libexecdir=$(exec-prefix)/lib \
	--mandir=$(exec-prefix)/share/man \
	--with-headers=$(ROOTFS)$(exec-prefix)/include \
	--enable-addons=ports
#	--exec-prefix=$(exec-prefix) \

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

package-build:

ifneq ($(ROOTFS),)
  install-args = \
	install_root=$(ROOTFS)
endif

incdir = $(ROOTFS)$(prefix)/$(TARGET)/include

package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(install-args) install-headers
	mkdir -p $(incdir)/gnu
	mkdir -p $(incdir)/bits
	touch $(incdir)/gnu/stubs.h
	cd $(pkgtree) && \
		cp include/features.h $(incdir)/features.h && \
		cp obj-$(TARGET)/bits/*.h $(incdir)/bits
ifeq ($(ARCH),arm)
	cd $(pkgtree) && \
		cp ports/sysdeps/unix/sysv/linux/arm/nptl/bits/pthreadtypes.h \
			$(incdir)/bits
endif

package-clean:
	@:

