PACKAGE = xorg-server
VERSION = 1.7.99.1

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
	--disable-xinerama \
	--disable-xvfb \
	--disable-xv \
	--disable-glx \
	--disable-dri \
	--disable-dri2 \
	--disable-dga \
	--enable-dpms \
	--enable-xv \
	--enable-xorg

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
