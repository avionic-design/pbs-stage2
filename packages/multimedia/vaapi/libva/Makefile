PACKAGE = libva
VERSION = 1.1.0
LICENSE = PD

LOCATION = http://www.freedesktop.org/software/vaapi/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

drivers = $(prefix)/lib/dri

prunefiles = \
	$(prefix)/lib/*.la \
	$(drivers)/*.la

stripfiles = \
	$(prefix)/bin/avcenc \
	$(prefix)/bin/h264encode \
	$(prefix)/bin/loadjpeg \
	$(prefix)/bin/mpeg2vldemo \
	$(prefix)/bin/putsurface \
	$(prefix)/bin/va_egl \
	$(prefix)/bin/vainfo \
	$(prefix)/lib/*.so.* \
	$(drivers)/*.so
