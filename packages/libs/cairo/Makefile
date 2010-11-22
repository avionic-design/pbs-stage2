PACKAGE = cairo
VERSION = 1.10.0

LOCATION = http://cairographics.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--enable-xcb

prunefiles = \
	$(prefix)/lib/cairo/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/cairo/*.so.* \
	$(prefix)/lib/*.so.*
