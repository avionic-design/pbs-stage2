PACKAGE = mediastreamer
VERSION = 2.12.1
LICENSE = GPL

LOCATION = http://download.savannah.gnu.org/releases/linphone/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-glx \
	--disable-video \
	--disable-rpath

# set via linphone for legacy reasons
ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_MEDIASTREAMER_SPEEX),y)
  conf-args += --disable-speex
else
  conf-args += --enable-speex
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/mediastream \
	$(prefix)/bin/msaudiocmp \
	$(prefix)/lib/*.so.*
