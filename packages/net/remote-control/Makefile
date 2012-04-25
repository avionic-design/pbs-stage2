PACKAGE = remote-control
VERSION = 0.8.2

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_AUDIO_ALSA),y)
	conf-args += --with-audio-backend=alsa
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_BACKLIGHT_DPMS),y)
	conf-args += --with-backlight-backend=dpms
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_BACKLIGHT_MEDATOM),y)
	conf-args += --with-backlight-backend=medatom
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_BACKLIGHT_SYSFS),y)
	conf-args += --with-backlight-backend=sysfs
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
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_GPIO_GPIODEV),y)
	conf-args += --with-gpio-backend=gpiodev
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_GPIO_SYSFS),y)
	conf-args += --with-gpio-backend=sysfs
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_JAVASCRIPT),y)
	conf-args += --enable-javascript
else
	conf-args += --disable-javascript
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_JAVASCRIPT_IR),y)
	conf-args += --enable-javascript-ir
else
	conf-args += --disable-javascript-ir
endif
ifeq ($(CONFIG_PACKAGE_NET_REMOTE_CONTROL_WATCHDOG),y)
	conf-args += --enable-watchdog
else
	conf-args += --disable-watchdog
endif

stripfiles = \
	$(prefix)/bin/remote-control-browser \
	$(prefix)/bin/remote-control-client \
	$(prefix)/bin/remote-control-gtk \
	$(prefix)/bin/remote-control \
	$(prefix)/lib/*.so.*
