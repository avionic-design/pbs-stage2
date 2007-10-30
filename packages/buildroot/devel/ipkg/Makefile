PACKAGE = ipkg
VERSION = 0.99.163

LOCATION = ftp://ftp.handhelds.org/packages/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/buildroot/devel/autotools.mk

conf-args += \
	--with-ipkglibdir=/var/lib

package-post-install:
	ln -sf ipkg-cl $(ROOTFS)$(prefix)/bin/ipkg

package-clean:
	@:

