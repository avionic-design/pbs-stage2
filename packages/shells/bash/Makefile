PACKAGE = bash
VERSION = 3.2

LOCATION = ftp://ftp.gnu.org/pub/gnu/bash
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--bindir=/bin \
	--disable-nls

package-pre-configure:
	cp support/config.{guess,sub} $(pkgtree)/support

package-post-install:
	$(priv) ln -sf bash $(ROOTFS)/bin/sh

package-clean:
	@:

