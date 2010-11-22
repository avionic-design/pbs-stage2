PACKAGE = libxdg-basedir
VERSION = 1.1.1

LOCATION = http://n.ethz.ch/~nevillm/download/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args-$(CONFIG_GLIBC) += ac_cv_func_malloc_0_nonnull=yes
conf-args-$(CONFIG_GLIBC) += ac_cv_func_realloc_0_nonnull=yes

conf-args += $(conf-args-y)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
