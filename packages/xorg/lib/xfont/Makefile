PACKAGE = libXfont
VERSION = 1.5.1

include packages/xorg/lib/common.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
