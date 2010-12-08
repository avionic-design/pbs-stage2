PACKAGE = gst-plugins-v4l2
VERSION = git

GIT_URL = git://git.adnet.avionic-design.de/gst-plugins-v4l2.git
include packages/autotools-git.mk

plugin = $(prefix)/lib/gstreamer-0.10

prunefiles = \
	$(plugin)/*.la

stripfiles = \
	$(plugin)/*.so
