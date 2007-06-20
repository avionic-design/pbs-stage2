PACKAGE = procps
VERSION = 3.2.7

LOCATION = http://procps.sourceforge.net
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	lib64=lib

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

