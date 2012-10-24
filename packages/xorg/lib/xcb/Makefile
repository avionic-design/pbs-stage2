PACKAGE = libxcb
VERSION = 1.8.1

LOCATION = http://xcb.freedesktop.org/dist

include packages/xorg/lib/common.mk

ACLOCAL_FLAGS = -I $(TOOLCHAIN_BASE_PATH)/$(TARGET)/usr/share/aclocal

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install $(ACLOCAL_FLAGS)
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

env += \
	LD_LIBRARY_PATH=$(BUILD_TOOLS)/lib

conf-args += \
	--with-sysroot=$(SYSROOT)

conf-vars += \
	ac_cv_XCBPROTO_XCBPYTHONDIR=$(SYSROOT)$(prefix)/lib/python2.7/site-packages \
	ac_cv_XCBPROTO_XCBINCLUDEDIR=$(SYSROOT)$(prefix)/share/xcb

prunefiles = \
	$(prefix)/lib/*la

stripfiles = \
	$(prefix)/lib/*.so.*
