PACKAGE = libXfont
VERSION = 1.4.5

include packages/xorg/lib/common.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
