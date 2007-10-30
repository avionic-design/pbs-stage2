PACKAGE = bash
VERSION = 3.2

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/buildroot/devel/autotools.mk

env = env -i PATH=${PATH}

conf-args += \
	--disable-nls

package-post-install:
	ln -sf bash $(ROOTFS)/tools/bin/sh

package-clean:
	@:

