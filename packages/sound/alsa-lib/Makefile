PACKAGE = alsa-lib
VERSION = 1.0.17rc2

LOCATION = ftp://ftp.alsa-project.org/pub/lib
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

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
	--disable-old-symbols \
	--disable-alisp \
	--disable-python \
	--with-softfloat

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LIBS='-lm'

package-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
	mkdir $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

mod-dir = $(prefix)/lib/alsa-lib
sover = 2.0.0

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) rm $(ROOTFS)$(prefix)/lib/libasound.la
	$(priv) find $(ROOTFS)$(mod-dir) -name '*.la' -exec rm {} +

libs-strip = \
	$(prefix)/lib/libasound.so.$(sover) \
	$(mod-dir)/smixer/smixer-sbase.so \
	$(mod-dir)/smixer/smixer-hda.so \
	$(mod-dir)/smixer/smixer-ac97.so

libs-strip := $(patsubst %,strip-$(ROOTFS)%,$(libs-strip))

$(libs-strip): strip-%: %
	@echo "  STRIP     $(subst $(ROOTFS),,$<)"
	@$(priv) $(STRIP) $<

_strip: $(libs-strip)
	@:

package-install: _install _strip
	@:

package-clean:
	@:

