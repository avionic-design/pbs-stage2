PACKAGE = sysfsutils
VERSION = 2.1.0

LOCATION = http://ovh.dl.sourceforge.net/sourceforge/linux-diag
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

package-pre-configure:
	cp support/config.{guess,sub} $(pkgtree)
	cp support/ltmain-sysroot.sh $(pkgtree)/ltmain.sh

#build-vars += \
#	INCLUDES='-I../../include'

package-post-install:
	$(priv) $(STRIP) $(ROOTFS)/usr/lib/libsysfs.so.*

package-clean:
	@:

