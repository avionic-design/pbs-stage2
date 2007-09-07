PACKAGE = fontconfig
VERSION = 2.4.2

LOCATION = http://fontconfig.org/release
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--with-freetype-config=$(ROOTFS)/usr/bin/freetype-config \
	--with-arch=$(ARCH)

#CC += --sysroot $(ROOTFS)
#LD += --sysroot $(ROOTFS)
#LDFLAGS += --sysroot $(ROOTFS)

#package-pre-configure:
#	cp support/ltmain-sysroot.sh $(pkgtree)/builds/unix/ltmain.sh

package-clean:
	@:

