PACKAGE = glibc
VERSION = 2.6.1

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

#autotools-subdir = hdr-$(HOST)
include packages/buildroot/autotools.mk

env := env -i PATH=/usr/bin:/bin

conf-args += \
	--with-binutils=$(ROOTFS)$(prefix)/bin \
	--enable-addons=ports

package-pre-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

install-args :=
install-vars := \
	install_root=$(ROOTFS)

install-targets = \
	install-headers

package-post-install:
	mkdir -p $(ROOTFS)$(prefix)/include/gnu
	touch $(ROOTFS)$(prefix)/include/gnu/stubs.h
	cd $(pkgtree) && \
		cp include/features.h $(ROOTFS)$(prefix)/include/features.h && \
		cp $(autotools-subdir)/bits/*.h $(ROOTFS)$(prefix)/include/bits && \
		cp ports/sysdeps/unix/sysv/linux/arm/nptl/bits/pthreadtypes.h \
			$(ROOTFS)$(prefix)/include/bits

