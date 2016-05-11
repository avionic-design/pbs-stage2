PACKAGE = libdvbpsi
VERSION = 1.3.0

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_VLC_VLC2X),y)
# VLC 2.0.7 needs dvbpsi_DeletePMT
# Go back to last version...
VERSION = 0.2.2
endif

LOCATION = http://download.videolan.org/pub/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
