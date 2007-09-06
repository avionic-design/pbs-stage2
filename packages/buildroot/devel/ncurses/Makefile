PACKAGE = ncurses
VERSION = 5.6

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/buildroot/devel/autotools.mk

#env = env -i PATH=$(ROOTFS)/tools/bin:/usr/bin:/bin

conf-args += \
	--with-shared

package-clean:
	@:

