PACKAGE = freetype
VERSION = 2.3.5

LOCATION = http://download.savannah.gnu.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/autotools.mk

#CC += --sysroot $(ROOTFS)
#LD += --sysroot $(ROOTFS)
LDFLAGS += --sysroot $(ROOTFS)

package-pre-configure:
	cp support/ltmain-sysroot.sh $(pkgtree)/builds/unix/ltmain.sh

package-clean:
	@:

