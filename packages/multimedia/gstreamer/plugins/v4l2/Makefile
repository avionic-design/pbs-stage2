PACKAGE = gst-plugins-v4l2
VERSION = git

GIT_URL = http://review.adnet.avionic-design.de/gst-plugins-v4l2.git
include packages/autotools-git.mk

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_GSTREAMER_DEBUG),y)
stripfiles = \
	$(plugin)/*.so
endif
