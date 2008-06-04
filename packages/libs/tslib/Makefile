PACKAGE = tslib
VERSION = 1.0

LOCATION = http://download.berlios.de/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/common.mk

CFLAGS += \
	-DUSE_INPUT_API=1

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--sysconfdir=/etc

conf-vars = \
	ac_cv_func_malloc_0_nonnull=yes \
	CFLAGS='$(CFLAGS)'

package-configure:
	cd $(pkgtree) && ./autogen.sh
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

files-strip = \
	/usr/lib/ts/variance.so \
	/usr/lib/ts/pthres.so \
	/usr/lib/ts/linear_h2200.so \
	/usr/lib/ts/mk712.so \
	/usr/lib/ts/linear.so \
	/usr/lib/ts/corgi.so \
	/usr/lib/ts/input.so \
	/usr/lib/ts/arctic2.so \
	/usr/lib/ts/dejitter.so \
	/usr/lib/ts/h3600.so \
	/usr/lib/ts/ucb1x00.so \
	/usr/lib/ts/collie.so \
	/usr/lib/libts-0.0.so.0.1.1 \
	/usr/bin/ts_test \
	/usr/bin/ts_print_raw \
	/usr/bin/ts_calibrate \
	/usr/bin/ts_harvest \
	/usr/bin/ts_print

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

