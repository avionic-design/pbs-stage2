PACKAGE = libee
VERSION = 0.4.1

LOCATION = http://www.libee.org/files/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk
NUM_CPU := 1

conf-vars-$(CONFIG_GLIBC) += ac_cv_func_malloc_0_nonnull=yes
conf-vars += $(conf-vars-y)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
