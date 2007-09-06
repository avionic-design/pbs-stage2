PACKAGE = diffutils
VERSION = 2.8.1

LOCATION = http://ftp.gnu.org/gnu/diffutils
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = file comparison utilities

##############################################################################

include packages/autotools.mk

ifneq ($(LIBC),gnu)
conf-vars += \
	ac_cv_func_mempcpy=no
endif

package-pre-configure:
	cp -f support/config.{guess,sub} $(pkgtree)/config

package-clean:
	@:

