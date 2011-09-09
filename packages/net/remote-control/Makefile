PACKAGE = remote-control
VERSION = 0.4.12

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_BACKLIGHT_DPMS),y)
	conf-args += --with-backlight-backend=dpms
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_BACKLIGHT_MEDATOM),y)
	conf-args += --with-backlight-backend=medatom
endif
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
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_MODEM_LIBMODEM),y)
	conf-args += --with-modem-backend=libmodem
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_HANDSET_PTIP),y)
	conf-args += --with-handset-backend=ptip
endif

stripfiles = \
	$(prefix)/bin/remote-control-browser \
	$(prefix)/bin/remote-control-client \
	$(prefix)/bin/remote-control-gtk \
	$(prefix)/bin/remote-control \
	$(prefix)/lib/*.so.*
