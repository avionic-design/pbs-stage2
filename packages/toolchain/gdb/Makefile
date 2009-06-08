PACKAGE = gdb
VERSION = 6.8

LOCATION = http://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man

conf-args += \
	--program-prefix=$(TARGET)-

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	MAKEFLAGS=

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

ifneq ($(ROOTFS),)
  install-args = \
	DESTDIR=$(ROOTFS)
endif

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
