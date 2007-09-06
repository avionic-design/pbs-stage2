PACKAGE = less
VERSION = 382

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

LDFLAGS += --sysroot $(ROOTFS)

install-vars += \
	prefix=$(ROOTFS)$(prefix)

package-clean:
	@:

