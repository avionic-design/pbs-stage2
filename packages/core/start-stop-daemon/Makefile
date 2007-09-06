PACKAGE = start-stop-daemon
VERSION = 1.14.5

##############################################################################

include packages/common.mk

package-extract:
	mkdir -p $(pkgtree) && cp -a packages/$(package)/src/* $(pkgtree)

build-args = \
	$(call set-args, CROSS_COMPILE)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

