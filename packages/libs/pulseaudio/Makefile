PACKAGE = pulseaudio
VERSION = 3.0
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))

LOCATION = http://freedesktop.org/software/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--with-udev-rules-dir=$(prefix)/lib/udev/rules.d \
	--disable-hal \
	--disable-static \
	--disable-rpath \
	--disable-manpages

ifeq ($(CONFIG_ARCH),arm)
conf-args += \
	--enable-atomic-arm-memory-barrier
endif

prunefiles = \
	$(prefix)/bin/esdcompat \
	$(prefix)/bin/start-pulseaudio-kde \
	$(prefix)/lib/*.la \
	$(prefix)/lib/pulseaudio/*.la

stripfiles = \
	$(prefix)/bin/pacat \
	$(prefix)/bin/pacmd \
	$(prefix)/bin/pactl \
	$(prefix)/bin/pasuspender \
	$(prefix)/bin/pax11publish \
	$(prefix)/bin/pulseaudio \
	$(prefix)/lib/*.so* \
	$(prefix)/lib/pulse-$(MAJOR).0/modules/*.so \
	$(prefix)/lib/pulseaudio/*.so
