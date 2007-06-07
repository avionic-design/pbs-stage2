PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

include packages/toolchain/common.mk

env += \
	CC=gcc \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	libc_ac_cv_tls=yes

ifeq ($(ARCH),arm)
  env += libc_cv_arm_tls=yes
endif

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

package-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	cd $(pkgtree) && mkdir -p hdr-$(HOST) && cd hdr-$(HOST) && \
		$(env) ../configure --host=$(HOST) --prefix=/usr \
			--enable-addons=ports \
			--with-headers=$(PLATFORM)/usr/include

package-build:

package-install:
	cd $(pkgtree)/hdr-$(HOST) && $(env) $(MAKE) install_root=$(PLATFORM) \
		install-headers
	mkdir -p $(PLATFORM)/usr/include/gnu
	touch $(PLATFORM)/usr/include/gnu/stubs.h
	cd $(pkgtree) && \
		cp include/features.h $(PLATFORM)/usr/include/features.h && \
		cp hdr-$(HOST)/bits/*.h $(PLATFORM)/usr/include/bits && \
		cp ports/sysdeps/unix/sysv/linux/arm/nptl/bits/pthreadtypes.h \
			$(PLATFORM)/usr/include/bits

