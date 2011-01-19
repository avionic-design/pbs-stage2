PACKAGE = remote-control
VERSION = git

GIT_URL = git://git.adnet.avionic-design.de/avionic-design/remote-control.git
include packages/autotools-git.mk

ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_VIDEO_VLC),n)
	conf-args += --with-video-backend=libvlc
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_VIDEO_NONE),n)
	conf-args += --with-video-backend=gst
endif

stripfiles = \
	$(prefix)/bin/remote-control-client \
	$(prefix)/bin/remote-control-gtk \
	$(prefix)/bin/remote-control \
	$(prefix)/lib/*.so.*
