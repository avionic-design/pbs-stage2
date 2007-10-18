PACKAGE = Linux-PAM
VERSION = 0.99.8.1

LOCATION = http://www.kernel.org/pub/linux/libs/pam/pre/library
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/devel/autotools.mk

conf-args += \
	--disable-rpath

package-clean:
	@:

