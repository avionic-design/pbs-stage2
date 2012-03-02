include packages/toolchain/gcc/Makefile.location

TARBALLS += \
	$(PACKAGE)-g++-$(VERSION).tar.bz2 \
	$(PACKAGE)-objc-$(VERSION).tar.bz2 \
	$(PACKAGE)-java-$(VERSION).tar.bz2

include packages/toolchain/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

languages-$(CONFIG_TOOLCHAIN_LANG_C) += c
languages-$(CONFIG_TOOLCHAIN_LANG_CXX) += c++
languages-$(CONFIG_TOOLCHAIN_LANG_OBJC) += objc
languages-$(CONFIG_TOOLCHAIN_LANG_OBJCXX) += obj-c++
languages-$(CONFIG_TOOLCHAIN_LANG_JAVA) += java
languages := $(subst $(space),$(comma),$(languages-y))

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
	--with-pkgversion="PBS $(RELEASE)" \
	--program-prefix=$(TARGET)- \
	--with-mpfr=$(prefix) \
	--with-gmp=$(prefix) \
	--with-ppl=$(prefix) \
	--enable-languages=$(languages) \
	--disable-libssp

ifeq ($(CONFIG_OS_NONE),y)
  conf-args += \
	--enable-multilib \
	--with-newlib

  ifeq ($(CONFIG_ARCH),arm)
    conf-args += --enable-interwork
  endif
endif

ifeq ($(CONFIG_ARCH),x86_64)
  conf-args += \
	--disable-multilib
endif

conf-args += \
	--with-as=$(prefix)/bin/$(TARGET)-as \
	--with-ld=$(prefix)/bin/$(TARGET)-ld \
	--with-sysroot=yes

# Java-specific arguments
conf-args-$(CONFIG_TOOLCHAIN_LANG_JAVA) += \
	--with-jvm-jar-dir=$(exec-prefix)/lib/jvm-exports \
	--with-jvm-root-dir=$(exec-prefix)/lib/jvm \
	--enable-java-home

conf-args += $(conf-args-y)

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(HOST) && \
		cd $(pkgbuildtree)/obj-$(HOST) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	-j $(NUM_CPU) \
	MAKEFLAGS=

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

CPP = $(prefix)/bin/$(TARGET)-cpp
CC = $(prefix)/bin/$(TARGET)-gcc
CXX = $(prefix)/bin/$(TARGET)-g++
GCJ = $(prefix)/bin/$(TARGET)-gcj

$(pkgtree)/.install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(HOST) && \
		$(env) $(MAKE) $(install-args) install
	# install wrapper script
	rm $(CC) && \
		sed -e 's,@VERSION@,$(VERSION),' $(pkgsrctree)/gcc.wrapper \
			> $(CC) && \
		chmod a+x $(CC)
	mv $(CXX) $(CXX)-$(VERSION) && ln -s $(TARGET)-gcc $(CXX)
	mv $(CPP) $(CPP)-$(VERSION) && ln -s $(TARGET)-gcc $(CPP)
ifeq ($(CONFIG_TOOLCHAIN_LANG_JAVA),y)
	mv $(GCJ) $(GCJ)-$(VERSION) && ln -s $(TARGET)-gcc $(GCJ)
endif
	$(call cmd,stamp)
