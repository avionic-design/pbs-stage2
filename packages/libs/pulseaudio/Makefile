PACKAGE = pulseaudio
VERSION = 0.9.21

LOCATION = http://0pointer.de/lennart/projects/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

libexecdir = $(prefix)/lib/pulse
module = $(libexecdir)/modules

conf-args += \
	--libexecdir=$(libexecdir) \
	--with-module-dir=$(module)

prunefiles = \
	$(prefix)/lib/*.la \
	$(module)/*.la

stripfiles = \
	$(prefix)/bin/pacat \
	$(prefix)/bin/pacmd \
	$(prefix)/bin/pactl \
	$(prefix)/bin/pasuspender \
	$(prefix)/bin/pulseaudio \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/*.so \
	$(module)/*.so
