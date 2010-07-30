PACKAGE = gcc
VERSION = 4.5.0

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)/$(PACKAGE)-$(VERSION)
TARBALLS = \
	$(PACKAGE)-core-$(VERSION).tar.bz2 \
	$(PACKAGE)-g++-$(VERSION).tar.bz2 \
	$(PACKAGE)-objc-$(VERSION).tar.bz2 \
	$(PACKAGE)-java-$(VERSION).tar.bz2

include packages/toolchain/common.mk
exec-prefix = $(prefix)/$(TARGET)
sysroot = $(exec-prefix)/sys-root

$(pkgtree)/.setup:
	$(call cmd,stamp)

ARCH := $(shell echo $(CONFIG_ARCH))
ifeq ($(ARCH),bfin)
  CONFIG_ARCH_HAS_JAVA = n
else
  CONFIG_ARCH_HAS_JAVA = y
endif

languages-y := c c++
languages-y += objc obj-c++
languages-$(CONFIG_ARCH_HAS_JAVA) += java

languages := $(shell echo $(languages-y) | tr ' ' ',')

conf-args = \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--datadir=$(exec-prefix)/share \
	--infodir=$(exec-prefix)/share/info \
	--mandir=$(exec-prefix)/share/man \
	--libdir=$(exec-prefix)/lib \
	--libexecdir=$(exec-prefix)/lib \
	--includedir=$(sysroot)/usr/include \
	--with-gxx-include-dir=$(sysroot)/usr/include/c++/$(VERSION) \
	--with-pkgversion="PBS $(subst $(quote),,$(CONFIG_VERSION))" \
	--program-prefix=$(TARGET)- \
	--with-mpfr=$(SYSROOT)$(prefix) \
	--with-gmp=$(SYSROOT)$(prefix) \
	--disable-libmudflap \
	--disable-libssp \
	--enable-shared \
	--enable-static \
	--enable-symvers=gnu \
	--enable-languages=$(languages)

conf-args += \
	--with-as=$(SYSROOT)$(prefix)/bin/$(TARGET)-as \
	--with-ld=$(SYSROOT)$(prefix)/bin/$(TARGET)-ld \
	--with-sysroot=yes

ifeq ($(FLOAT),soft)
  conf-args += --with-float=soft
endif

ifneq ($(findstring multilib,$(variant)),)
  conf-args += --enable-multilib
else
  conf-args += --disable-multilib
endif

# Java-specific arguments
conf-args += \
	--with-jvm-jar-dir=$(exec-prefix)/lib/jvm-exports \
	--with-jvm-root-dir=$(exec-prefix)/lib/jvm \
	--enable-java-home

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(HOST) && \
		cd $(pkgbuildtree)/obj-$(HOST) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	-j $(NUM_CPU) \
	MAKEFLAGS=

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

ifneq ($(SYSROOT),)
  CC = $(SYSROOT)$(prefix)/bin/$(TARGET)-gcc
  CXX = $(SYSROOT)$(prefix)/bin/$(TARGET)-g++
  CPP = $(SYSROOT)$(prefix)/bin/$(TARGET)-cpp
  JC = $(SYSROOT)$(prefix)/bin/$(TARGET)-gcj
  install-args = \
	DESTDIR=$(SYSROOT)
else
  CC = $(prefix)/bin/$(TARGET)-gcc
  CXX = $(prefix)/bin/$(TARGET)-g++
  CPP = $(prefix)/bin/$(TARGET)-cpp
  JC = $(prefix)/bin/$(TARGET)-gcj
endif

$(pkgtree)/.install:
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	# install wrapper script
	rm $(CC) && \
		sed -e 's,@VERSION@,$(VERSION),' $(pkgsrctree)/gcc.wrapper \
			> $(CC) && \
		chmod a+x $(CC)
	mv $(CXX) $(CXX)-$(VERSION) && ln -s $(TARGET)-gcc $(CXX)
	mv $(CPP) $(CPP)-$(VERSION) && ln -s $(TARGET)-gcc $(CPP)
ifeq ($(CONFIG_ARCH_HAS_JAVA),y)
	mv $(JC) $(JC)-$(VERSION) && ln -s $(TARGET)-gcc $(JC)
endif
	$(call cmd,stamp)
