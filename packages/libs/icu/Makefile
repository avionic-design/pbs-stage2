PACKAGE = icu4c
VERSION = 4.0d02

LOCATION = http://download.icu-project.org/files/icu4c/4.0
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info

conf-vars = \
	CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CXXFLAGS="$(CXXFLAGS)"

package-configure:
	mkdir -p $(pkgtree)/obj-build && \
		cd $(pkgtree)/obj-build && \
			env -i PATH=${PATH} ../configure \
				--cache-file=$(pkgtree)/obj-build/config.cache
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars) \
				--cache-file=$(pkgtree)/obj-$(TARGET)/config.cache

build-args = \
	BUILD_BINDIR=$(pkgtree)/obj-build/bin \
	BUILD_LIBDIR=$(pkgtree)/obj-build/lib

package-build:
	cd $(pkgtree)/obj-build && \
		env -i PATH=${PATH} $(MAKE)
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	BUILD_BINDIR=$(pkgtree)/obj-build/bin \
	BUILD_LIBDIR=$(pkgtree)/obj-build/lib \
	DESTDIR=$(ROOTFS)

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

sover = 40.0

prunefiles =
stripfiles = \
	$(prefix)/bin/derb \
	$(prefix)/bin/genbrk \
	$(prefix)/bin/gencnval \
	$(prefix)/bin/genctd \
	$(prefix)/bin/genrb \
	$(prefix)/bin/makeconv \
	$(prefix)/bin/pkgdata \
	$(prefix)/bin/uconv \
	$(prefix)/lib/libicutu.so.$(sover) \
	$(prefix)/lib/libiculx.so.$(sover) \
	$(prefix)/lib/libicui18n.so.$(sover) \
	$(prefix)/lib/libicuio.so.$(sover) \
	$(prefix)/lib/libicudata.so.$(sover) \
	$(prefix)/lib/libicule.so.$(sover) \
	$(prefix)/lib/libicuuc.so.$(sover) \
	$(prefix)/sbin/genccode \
	$(prefix)/sbin/gencmn \
	$(prefix)/sbin/gensprep \
	$(prefix)/sbin/genuca \
	$(prefix)/sbin/icupkg \
	$(prefix)/sbin/icuswap

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

