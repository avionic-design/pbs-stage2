include packages/toolchain/glibc/Makefile.location
include packages/build-tools/autotools.mk

conf-args += \
	--disable-profile \
	--disable-shared \
	--disable-build-nscd \
	--disable-nscd \
	--without-gd \
	--without-selinux

install-target = install-bin
install-args += \
	-j $(NUM_CPU)

ifeq ($(CONFIG_PACKAGE_BUILD_TOOLS_GLIBC_LOCALES),y)
install-target += localedata/install-locales
endif

