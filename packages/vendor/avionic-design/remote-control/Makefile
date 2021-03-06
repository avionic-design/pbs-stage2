PACKAGE = remote-control
VERSION = 2.1.0

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_AUDIO_ALSA),y)
	conf-args += --with-audio-backend=alsa
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_AUDIO_PULSE),y)
	conf-args += --with-audio-backend=pulse
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_BACKLIGHT_DPMS),y)
	conf-args += --with-backlight-backend=dpms
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_BACKLIGHT_MEDATOM),y)
	conf-args += --with-backlight-backend=medatom
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_BACKLIGHT_SYSFS),y)
	conf-args += --with-backlight-backend=sysfs
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_VIDEO_VLC),y)
	conf-args += --with-video-backend=libvlc
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_VIDEO_GST),y)
	conf-args += --with-video-backend=gst
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_SMARTCARD_LIBPCSCLITE),y)
	conf-args += --enable-libpcsclite
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_SMARTCARD_LIBSMARTCARD),y)
	conf-args += --enable-libsmartcard
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_SMARTCARD_INFO),y)
	conf-args += --enable-smartcard_info
endif

ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_VOIP_LINPHONE),y)
	conf-args += --with-voip-backend=linphone
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_MIXER_ALSA),y)
	conf-args += --with-mixer-backend=alsa
else
	conf-args += --with-mixer-backend=none
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_MODEM_LIBMODEM),y)
	conf-args += --with-modem-backend=libmodem
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_MODEM_LIBMODEM_ALSALOOP),y)
	conf-args += --enable-alsaloop
endif
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_HANDSET_PTIP),y)
	conf-args += --with-handset-backend=ptip
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_GPIO_GPIODEV),y)
	conf-args += --with-gpio-backend=gpiodev
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_GPIO_SYSFS),y)
	conf-args += --with-gpio-backend=sysfs
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_JAVASCRIPT_IR),y)
	conf-args += --enable-javascript-ir
else
	conf-args += --disable-javascript-ir
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_JAVASCRIPT_LCD),y)
	conf-args += --enable-javascript-lcd
else
	conf-args += --disable-javascript-lcd
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_JAVASCRIPT_MEDIAL),y)
	conf-args += --enable-javascript-medial
else
	conf-args += --disable-javascript-medial
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_JAVASCRIPT_APP_WATCHDOG),y)
	conf-args += --enable-javascript-app-watchdog
else
	conf-args += --disable-javascript-app-watchdog
endif
ifeq ($(CONFIG_PACKAGE_VENDOR_AVIONIC_DESIGN_REMOTE_CONTROL_WATCHDOG),y)
	conf-args += --enable-watchdog
else
	conf-args += --disable-watchdog
endif

ifeq ($(CONFIG_VIRTUAL_LIBS_GTK_GTK3),y)
	conf-args += --with-gtk=3.0
else
	conf-args += --with-gtk=2.0
endif

conf-args += \
	--enable-lldpctl \
	--disable-nls

stripfiles = \
	$(prefix)/bin/remote-control-browser \
	$(prefix)/bin/remote-control-client \
	$(prefix)/bin/remote-control \
	$(prefix)/lib/*.so.*

prunefiles = \
	$(prefix)/lib/*.la
