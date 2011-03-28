PACKAGE = remote-control
VERSION = 0.4.6

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_VIDEO_VLC),y)
	conf-args += --with-video-backend=libvlc
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_VIDEO_GST),y)
	conf-args += --with-video-backend=gst
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_SMARTCARD_LIBSMARTCARD),y)
	conf-args += --with-smartcard-backend=libsmartcard
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_SMARTCARD_LIBCCID),y)
	conf-args += --with-smartcard-backend=libccid
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_VOIP_LINPHONE),y)
	conf-args += --with-voip-backend=linphone
endif

stripfiles = \
	$(prefix)/bin/remote-control-client \
	$(prefix)/bin/remote-control-gtk \
	$(prefix)/bin/remote-control \
	$(prefix)/lib/*.so.*
