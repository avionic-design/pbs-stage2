PACKAGE = diffutils
VERSION = 3.5

LOCATION = ftp://ftp.gnu.org/gnu/diffutils
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifneq ($(LIBC),gnu)
conf-vars += \
	ac_cv_func_mempcpy=no
endif

prunefiles =
stripfiles = \
	$(prefix)/bin/cmp \
	$(prefix)/bin/diff \
	$(prefix)/bin/diff3 \
	$(prefix)/bin/sdiff
