PACKAGE = libjpeg
VERSION = 6b

LOCATION = ftp://ftp.uu.net/graphics/jpeg
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CFLAGS='$(CFLAGS)'

package-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh
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

prunefiles = \
	$(prefix)/lib/libjpeg.la

stripfiles = \
	$(prefix)/bin/jpegtran \
	$(prefix)/bin/wrjpgcom \
	$(prefix)/bin/djpeg \
	$(prefix)/bin/cjpeg \
	$(prefix)/bin/rdjpgcom \
	$(prefix)/lib/libjpeg.so.62.0.0

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

