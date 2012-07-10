PACKAGE = json-c
VERSION = 0.9
LICENSE = MIT

LOCATION = http://oss.metaparadigm.com/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

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

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
