PACKAGE = xorg-server
VERSION = 1.7.99.2

ifeq ($(CONFIG_XORG_IEGD),y)
VERSION = 1.6.5
endif

LOCATION = http://xorg.freedesktop.org/releases/individual/xserver
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-xkb-output=/var/lib/xkb \
	--disable-null-root-cursor \
	--disable-config-dbus \
	--enable-config-hal \
	--disable-kdrive \
	--disable-xfbdev \
	--disable-xvfb \
	--disable-dga \
	--enable-dpms \
	--enable-xorg

ifeq ($(CONFIG_XORG_AIGLX),y)
  conf-args += --enable-aiglx
else
  conf-args += --disable-aiglx
endif

ifeq ($(CONFIG_XORG_DRI),y)
  conf-args += \
	--enable-dri2 \
	--enable-dri
else
  conf-args += \
	--disable-dri2 \
	--disable-dri
endif

ifeq ($(CONFIG_XORG_GLX),y)
  conf-args += --enable-glx
else
  conf-args += --disable-glx
endif

ifeq ($(CONFIG_XORG_XV),y)
  conf-args += --enable-xv
else
  conf-args += --disable-xv
endif

ifeq ($(CONFIG_XORG_XINERAMA),y)
  conf-args += --enable-xinerama
else
  conf-args += --disable-xinerama
endif

conf-vars += \
	ac_cv_file__etc_X11_fontpath_d=yes

module = $(prefix)/lib/xorg/modules

prunefiles = \
	$(module)/*.la \
	$(module)/extensions/*.la \
	$(module)/linux/*.la \
	$(module)/multimedia/*.la

stripfiles = \
	$(prefix)/bin/cvt \
	$(prefix)/bin/gtf \
	$(prefix)/bin/Xnest \
	$(prefix)/bin/Xorg \
	$(prefix)/bin/Xvfb \
	$(module)/*.so \
	$(module)/extensions/*.so \
	$(module)/linux/*.so \
	$(module)/multimedia/*.so
