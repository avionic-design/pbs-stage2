PACKAGE = binutils

ifeq ($(BINUTILS_VERSION),snapshot)
  BINUTILS_VERSION = $(BINUTILS_SNAPSHOT)
  LOCATION = http://kernel.org/pub/linux/devel/binutils
else
  LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
endif

VERSION  = $(BINUTILS_VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

##############################################################################

include packages/toolchain/common.mk
exec-prefix = $(prefix)/$(TARGET)

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--libdir=$(exec-prefix)/lib \
	--with-sysroot=yes \
	--disable-nls

ifneq ($(findstring multilib,$(variant)),)
  conf-args += \
	--enable-multilib
else
  conf-args += \
	--disable-multilib
endif

$(pkgtree)/.configure:
	cd $(pkgbuildtree) && $(env) ./configure $(conf-args)
	$(call cmd,stamp)

build-args =

$(pkgtree)/.build:
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

ifneq ($(SYSROOT),)
  install-args = \
	DESTDIR=$(SYSROOT)
endif

$(pkgtree)/.install:
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)
