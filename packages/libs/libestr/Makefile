PACKAGE = libestr
VERSION = 0.1.6
LICENSE = LGPL

LOCATION = http://libestr.adiscon.com/files/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars-$(CONFIG_GLIBC) += ac_cv_func_malloc_0_nonnull=yes
conf-vars += $(conf-vars-y)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
