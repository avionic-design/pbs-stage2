PACKAGE = abox
VERSION = 000

include packages/common.mk

srcdir = packages/$(package)/src

package-configure:

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS)

package-build:
	cd $(srcdir)/usr/lib && $(env) $(MAKE) $(build-args)
	cd $(srcdir)/usr/bin && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(srcdir)/usr/lib && $(env) $(MAKE) $(install-args) install
	cd $(srcdir)/usr/bin && $(env) $(MAKE) $(install-args) install

