PACKAGE = grep
VERSION = 2.5.1a

LOCATION = ftp://ftp.cs.tu-berlin.de/pub/gnu/grep
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/autotools.mk

package-pre-configure:
	cp support/config.{guess,sub} $(pkgtree)

conf-args += \
	--bindir=/bin \
	--disable-nls \
	--disable-perl-regexp

conf-vars += \
	ac_cv_func_mempcpy=no

