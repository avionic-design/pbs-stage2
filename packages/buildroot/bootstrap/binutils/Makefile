PACKAGE = binutils
VERSION = 2.18

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/bootstrap/autotools.mk

conf-args += \
	--with-sysroot=$(ROOTFS) \
	--with-lib-path=$(prefix)/lib \
	--disable-nls

package-clean:
	@:

