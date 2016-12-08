PACKAGE = freerdp
VERSION = 1.0.1
LICENSE = Apache-2.0

LOCATION = https://github.com/FreeRDP/FreeRDP/archive
TARBALLS = $(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/cmake.mk

pkgbuildtree := $(pkgtree)/FreeRDP-$(VERSION)

cmake-args += \
	-DWITH_CUPS=OFF

plugin = $(prefix)/lib/$(PACKAGE)

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/xfreerdp \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
