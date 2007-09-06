PACKAGE = grep
VERSION = 2.5.3

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = utility to search for text in files

##############################################################################

include packages/autotools.mk

package-pre-configure:
	cp support/config.{guess,sub} $(pkgtree)

conf-args += \
	--bindir=/bin \
	--disable-nls \
	--disable-perl-regexp

ifneq ($(LIBC),gnu)
conf-vars += \
	ac_cv_func_mempcpy=no
endif

package-clean:
	@:

