PACKAGE = libxcb
VERSION = 1.12
LICENSE = custom

LOCATION = http://xcb.freedesktop.org/dist

include packages/xorg/lib/common-reconf.mk

conf-args += \
	--disable-devel-docs

conf-vars += \
	ac_cv_XCBPROTO_XCBPYTHONDIR=$(SYSROOT)$(prefix)/lib/python2.7/site-packages \
	ac_cv_XCBPROTO_XCBINCLUDEDIR=$(SYSROOT)$(prefix)/share/xcb

prunefiles = \
	$(prefix)/lib/*la

stripfiles = \
	$(prefix)/lib/*.so.*
