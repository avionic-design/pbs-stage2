PACKAGE = libinput
VERSION = 1.7.0
LICENSE = custom

LOCATION = https://www.freedesktop.org/software/libinput
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-event-gui \
	--disable-libwacom

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/* \
	$(prefix)/lib/*.so
