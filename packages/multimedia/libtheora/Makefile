PACKAGE = libtheora
VERSION = 1.1.1

LOCATION = http://downloads.xiph.org/releases/theora
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-examples

ifeq ($(CONFIG_ARCH_ARM_SOFT_FP),y)
  conf-args += --disable-float
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
