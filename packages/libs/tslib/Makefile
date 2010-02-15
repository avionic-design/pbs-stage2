PACKAGE = tslib
VERSION = 1.0.0-svn70

LOCATION = http://download.berlios.de/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

CPPFLAGS += -DUSE_INPUT_API=1

ifeq ($(CONFIG_LIBC),uclibc)
  conf-vars += \
	ac_cv_func_malloc_0_nonnull=yes
else
  conf-vars += \
	ac_cv_func_malloc_0_nonnull=no
endif

plugin = $(prefix)/lib/ts

prunefiles = \
	/etc/ts.conf \
	$(prefix)/lib/libts.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/ts_test \
	$(prefix)/bin/ts_print_raw \
	$(prefix)/bin/ts_calibrate \
	$(prefix)/bin/ts_harvest \
	$(prefix)/bin/ts_print \
	$(prefix)/lib/libts-1.0.so.0.0.0 \
	$(plugin)/*.so
