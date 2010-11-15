PACKAGE = imlib2
VERSION = 1.4.4

LOCATION = http://prdownloads.sourceforge.net/enlightenment
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

plugin = $(prefix)/lib/imlib2

prunefiles = \
	$(prefix)/bin/imlib2-config \
	$(plugin)/filters/*.la \
	$(plugin)/loaders/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/imlib2_bumpmap \
	$(prefix)/bin/imlib2_colorspace \
	$(prefix)/bin/imlib2_conv \
	$(prefix)/bin/imlib2_grab \
	$(prefix)/bin/imlib2_poly \
	$(prefix)/bin/imlib2_show \
	$(prefix)/bin/imlib2_test \
	$(prefix)/bin/imlib2_view \
	$(plugin)/filters/*.so \
	$(plugin)/loaders/*.so \
	$(prefix)/lib/*.so.*
