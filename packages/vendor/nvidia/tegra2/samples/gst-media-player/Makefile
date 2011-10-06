PACKAGE = GstMediaPlayer
VERSION = 19.0028

LOCATION = http://ftp.avionic-design.de/nvidia/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--disable-werror

stripfiles = \
	$(prefix)/bin/GstMediaPlayer
