PACKAGE = abox
VERSION = 000

include packages/common.mk

srcdir = packages/$(package)/src

package-configure:

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS)

package-build:
	$(Q)cd $(srcdir) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	$(Q)cd $(srcdir) && $(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	$(Q)cd $(srcdir) && $(env) $(MAKE) clean

