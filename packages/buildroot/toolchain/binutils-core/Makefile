# binutils package that runs on the build system. This is necessary so the
# bootstrapping gcc can be built, which is in turn needed to build the C
# runtime library.
#
# binutils will be built again later so it can be run in the root jail.

PACKAGE = binutils
VERSION = 2.18

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/toolchain/autotools.mk

ifneq ($(HOST), $(TARGET))
  conf-args := \
	--target=$(TARGET) \
	$(conf-args)
endif

conf-args += \
	--with-sysroot=$(ROOTFS) \
	--program-prefix=$(TARGET)- \
	--disable-nls

package-clean:
	@:

