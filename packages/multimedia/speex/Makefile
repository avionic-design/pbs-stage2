PACKAGE = speex
VERSION = 1.2rc1
LICENSE = Xiph BSD

LOCATION = http://downloads.xiph.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--enable-fixed-point \
	--disable-oggtest \
	--with-ogg=$(SYSROOT)$(prefix)

ifeq ($(CONFIG_ARCH),arm)
# The DSP code should be optimized much as possible!
OPTFLAGS := $(subst -Os,-O3,$(OPTFLAGS))

test = $(shell test $(1) && echo y)
ifeq ($(and $(call test,$(CONFIG_ARCH_ARM_ARCH_VERSION) -ge 5),$(CONFIG_ARCH_ARM_EXT_E)),y)
conf-args += \
	--enable-arm5e-asm
else ifeq ($(call test,$(CONFIG_ARCH_ARM_ARCH_VERSION) -ge 4),y)
conf-args += \
	--enable-arm4-asm
endif
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/speexdec \
	$(prefix)/bin/speexenc \
	$(prefix)/lib/*.so.*
