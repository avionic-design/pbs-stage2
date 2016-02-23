PACKAGE = gst-plugins-good
VERSION = 1.6.0
LICENSE = LGPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://gstreamer.freedesktop.org/src/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--disable-examples \
	--disable-shout2 \
	--disable-aalib \
	--disable-rpath

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_ORC),y)
  conf-vars += ORCC=orcc
  conf-args += --enable-orc
else
  conf-args += --disable-orc
endif

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DISABLE_RARE),y)
conf-args += \
	--disable-alpha \
	--disable-apetag \
	--disable-audiofx \
	--disable-effectv \
	--disable-icydemux \
	--disable-imagefreeze \
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
