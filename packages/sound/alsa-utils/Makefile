PACKAGE = alsa-utils
VERSION = 1.0.19

LOCATION = ftp://ftp.alsa-project.org/pub/utils
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

# add the support directory to the PATH for ncurses5-config
env := $(patsubst PATH=%,PATH=$(srctree)/support:%,$(env))

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
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

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles =
stripfiles = \
	$(prefix)/bin/aconnect \
	$(prefix)/bin/alsamixer \
	$(prefix)/bin/amidi \
	$(prefix)/bin/amixer \
	$(prefix)/bin/aplay \
	$(prefix)/bin/aplaymidi \
	$(prefix)/bin/arecordmidi \
	$(prefix)/bin/aseqdump \
	$(prefix)/bin/aseqnet \
	$(prefix)/bin/iecset \
	$(prefix)/bin/speaker-test \
	$(prefix)/sbin/alsactl

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

