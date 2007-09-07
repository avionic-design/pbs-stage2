PACKAGE = gettext
VERSION = 0.16.1

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--disable-openmp

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/build-aux/ltmain.sh

package-clean:
	@:

