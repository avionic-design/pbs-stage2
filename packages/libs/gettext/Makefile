PACKAGE = gettext
VERSION = 0.16.1

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-args += \
	--disable-openmp \
	--disable-rpath

conf-vars = \
	CC='$(CC) --sysroot $(ROOTFS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

_package-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) rm $(ROOTFS)$(prefix)/lib/libasprintf.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgettextlib.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgettextpo.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libgettextsrc.la
	$(priv) rm $(ROOTFS)$(prefix)/lib/libintl.la

libs-strip = \
	$(prefix)/lib/libasprintf.so.0.0.0 \
	$(prefix)/lib/libgettextlib-0.16.1.so \
	$(prefix)/lib/libgettextpo.so.0.3.0 \
	$(prefix)/lib/libgettextsrc-0.16.1.so \
	$(prefix)/lib/libintl.so.8.0.1

libs-strip := $(patsubst %,strip-$(ROOTFS)%,$(libs-strip))

$(libs-strip): strip-%: %
	@echo "  STRIP     $(subst $(ROOTFS),,$<)"
	@$(priv) $(STRIP) $<

_strip: $(libs-strip)
	@:

package-install: _package-install _strip
	@:

package-clean:
	@:

