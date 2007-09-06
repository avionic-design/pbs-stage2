PACKAGE = iputils
VERSION = s20070202

LOCATION = http://www.skbuff.net/iputils
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

LDFLAGS := $(CFLAGS) $(LDFLAGS)
env = env -i

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS) \
	IPV4_TARGETS='ping arping' \
	IPV6_TARGETS='ping6'

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

package-install:
	cd $(pkgtree) && $(priv) install -t $(ROOTFS)/usr/bin ping arping ping6

package-clean:
	@:

