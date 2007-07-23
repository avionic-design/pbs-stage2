PACKAGE = bash
VERSION = 3.2

LOCATION = ftp://ftp.gnu.org/pub/gnu/bash
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/buildroot/autotools.mk

env = env -i PATH=/usr/bin:/bin

conf-args += \
	--disable-nls

package-post-install:
	ln -sf bash $(ROOTFS)/tools/bin/sh

