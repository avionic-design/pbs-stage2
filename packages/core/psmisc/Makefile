PACKAGE = psmisc
VERSION = 22.10

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
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

prunefiles =
stripfiles = \
	$(prefix)/bin/fuser \
	$(prefix)/bin/killall \
	$(prefix)/bin/peekfd \
	$(prefix)/bin/prtstat \
	$(prefix)/bin/pstree
