PACKAGE = bash
VERSION = 3.2

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/info \
	--sysconfdir=/etc \
	--bindir=/bin

conf-args += \
	--disable-nls

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)'

ifeq ($(ARCH),blackfin)
conf-args += \
	--with-bash-malloc=no
endif

package-configure:
	cp support/config.{guess,sub} $(pkgtree)/support
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) ln -sf bash $(ROOTFS)/bin/sh

prunefiles =
stripfiles = \
	/bin/bash

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

