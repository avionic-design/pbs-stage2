PACKAGE = gettext
VERSION = 0.17

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))

env += \
	PKG_CONFIG_LIBDIR=$(ROOTFS)$(prefix)/lib/pkgconfig \
	PKG_CONFIG_SYSROOT_DIR=$(ROOTFS)

$(pkgtree)/.setup:
	$(call cmd,stamp)

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
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

prunefiles = \
	$(prefix)/lib/libasprintf.la \
	$(prefix)/lib/libgettextlib.la \
	$(prefix)/lib/libgettextpo.la \
	$(prefix)/lib/libgettextsrc.la

ifneq ($(LIBC),gnu)
prunefiles += \
	$(prefix)/lib/libintl.la
endif

po-version   = 0.4.0
intl-version = 8.0.2
plugin       = $(prefix)/lib/gettext

stripfiles = \
	$(prefix)/bin/envsubst \
	$(prefix)/bin/gettext \
	$(prefix)/bin/msgattrib \
	$(prefix)/bin/msgcat \
	$(prefix)/bin/msgcmp \
	$(prefix)/bin/msgcomm \
	$(prefix)/bin/msgconv \
	$(prefix)/bin/msgen \
	$(prefix)/bin/msgexec \
	$(prefix)/bin/msgfilter \
	$(prefix)/bin/msgfmt \
	$(prefix)/bin/msggrep \
	$(prefix)/bin/msginit \
	$(prefix)/bin/msgmerge \
	$(prefix)/bin/msgunfmt \
	$(prefix)/bin/msguniq \
	$(prefix)/bin/ngettext \
	$(prefix)/bin/recode-sr-latin \
	$(prefix)/bin/xgettext \
	$(prefix)/lib/libasprintf.so.0.0.0 \
	$(prefix)/lib/libgettextlib-$(VERSION).so \
	$(prefix)/lib/libgettextpo.so.$(po-version) \
	$(prefix)/lib/libgettextsrc-$(VERSION).so \
	$(plugin)/hostname \
	$(plugin)/urlget

ifneq ($(LIBC),gnu)
stripfiles += \
	$(prefix)/lib/libintl.so.$(intl-version)
endif

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
