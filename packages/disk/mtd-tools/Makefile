PACKAGE = mtd-utils
VERSION = 1.1.0

LOCATION = ftp://ftp.infradead.org/pub/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION = memory technology device tools

##############################################################################

include packages/common.mk
prefix = /usr

# only build these tools
RAWTARGETS = \
	flashcp \
	flash_erase \
	flash_eraseall \
	flash_info \
	flash_lock \
	flash_unlock

build-args = \
	$(call set-args, RAWTARGETS) \
	CROSS=$(CROSS_COMPILE)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS) \
	MANDIR=$(prefix)/share/man \
	$(call set-args, RAWTARGETS) \
	CROSS=$(CROSS_COMPILE)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	@for b in $(RAWTARGETS); do \
		echo "STRIP   $(ROOTFS)$(prefix)/sbin/$$b"; \
		$(priv) $(STRIP) $(ROOTFS)$(prefix)/sbin/$$b; \
	done

package-clean:
	@:

