PACKAGE = cifs-utils
VERSION = 4.8.1

LOCATION = ftp://ftp.samba.org/pub/linux-cifs/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

ifeq ($(CONFIG_LIBC),gnu)
  conf-vars += \
	ac_cv_func_realloc_0_nonnull=yes \
	ac_cv_func_malloc_0_nonnull=yes
else
  conf-vars += \
	ac_cv_func_realloc_0_nonnull=no \
	 ac_cv_func_malloc_0_nonnull=no
endif

stripfiles = \
	/sbin/mount.cifs
