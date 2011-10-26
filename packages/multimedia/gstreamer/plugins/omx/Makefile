PACKAGE = gst-openmax
VERSION = 0.10.1

ifeq ($(CONFIG_ARCH_TEGRA_2x_SOC),y)
  patchdir = $(pkgsrctree)/patches-$(VERSION)
  VERSION = 0.10.0.5
endif

LOCATION = http://gstreamer.freedesktop.org/src/gst-openmax
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

ifeq ($(CONFIG_ARCH_TEGRA_2x_SOC),y)
include packages/autotools-reconf.mk

conf-args += \
	--enable-experimental \
	--enable-tegra
else
include packages/autotools.mk
endif

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so
