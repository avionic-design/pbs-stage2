PACKAGE = gst-plugins-good
VERSION = 1.0.7
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

env += FATAL_WARNINGS=no

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-aalib \
	--disable-annodex \
	--disable-esd \
	--disable-shout2

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_RARE),y)
conf-args += \
	--disable-alpha \
	--disable-apetag \
	--disable-audiofx \
	--disable-effectv \
	--disable-icydemux \
	--disable-imagefreeze \
	--disable-isomp4 \
	--disable-monoscope \
	--disable-shapewipe \
	--disable-smpte \
	--disable-spectrum \
	--disable-y4m \
	--disable-directsound \
	--disable-oss \
	--disable-oss4 \
	--disable-sunaudio \
	--disable-osx_audio \
	--disable-osx_video \
	--disable-x \
	--disable-xshm \
	--disable-xvideo \
	--disable-aalib \
	--disable-aalibtest \
	--disable-jack \
	--disable-libcaca \
	--disable-libdv \
	--disable-dv1394
endif

plugin = $(prefix)/lib/gstreamer-$(MAJOR).$(MINOR)

prunefiles = \
	$(plugin)/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so
endif
