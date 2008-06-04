PACKAGE = jpeg
VERSION = 6b

LOCATION = ftp://ftp.uu.net/graphics/jpeg
TARBALLS = $(PACKAGE)src.v$(VERSION).tar.gz

##############################################################################

include packages/common.mk

conf-args = \
	--prefix=$(prefix) \
	--host=$(TARGET)

conf-vars = \
	CC='$(CC)' \
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
	prefix=$(ROOTFS)$(prefix) \
	mandir=$(ROOTFS)$(prefix)/share/man/man1

_package-install:
	$(priv) mkdir -p $(ROOTFS)$(prefix)/share/man/man1
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

files-strip = \
	/usr/bin/jpegtran \
	/usr/bin/wrjpgcom \
	/usr/bin/djpeg \
	/usr/bin/cjpeg \
	/usr/bin/rdjpgcom

files-strip := $(patsubst %,strip-$(ROOTFS)%,$(files-strip))

$(files-strip): strip-%: %
	@echo "  STRIP     $(subst $(ROOTFS),,$<)"
	@$(priv) $(STRIP) $<

_strip: $(files-strip)
	@:

package-install: _package-install _strip
	@:

package-clean:
	@:

