PACKAGE = libxcb
VERSION = 1.8.1

LOCATION = http://xcb.freedesktop.org/dist

include packages/xorg/lib/common-reconf.mk

env += \
	LD_LIBRARY_PATH=$(BUILD_TOOLS)/lib

conf-vars += \
	ac_cv_XCBPROTO_XCBPYTHONDIR=$(SYSROOT)$(prefix)/lib/python2.7/site-packages \
	ac_cv_XCBPROTO_XCBINCLUDEDIR=$(SYSROOT)$(prefix)/share/xcb

prunefiles = \
	$(prefix)/lib/*la

stripfiles = \
	$(prefix)/lib/*.so.*
