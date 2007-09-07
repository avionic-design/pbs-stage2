PACKAGE = glib
VERSION = 2.12.12

LOCATION = ftp://ftp.gtk.org/pub/glib/2.12
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

conf-args += \
	--with-libiconv=gnu

conf-vars += \
	glib_cv_stack_grows=yes \
	glib_cv_uscore=no \
	ac_cv_func_posix_getpwuid_r=yes

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

package-clean:
	@:

