PACKAGE = libav
VERSION = 11.7

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_VLC_VLC2X),y)
# VLC 2.0.7 needs libavcodec <= 54
# Go back to 9.18 since thats the latest version supporting that version
VERSION = 9.18
endif

LOCATION = http://libav.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args = \
	--prefix=$(prefix) \
	--cross-prefix=$(TARGET)- \
	--enable-cross-compile \
	--target-os=$(CONFIG_OS) \
	--arch=$(CONFIG_ARCH) \
	--sysroot=$(SYSROOT) \
	--extra-cflags="$(CFLAGS)" \
	--extra-ldflags="$(LDFLAGS)" \
	--enable-shared \
	--enable-gpl \
	--disable-encoders \
	--disable-doc \
	--pkg-config=pkg-config \
	$(platform-conf-args)

conf-vars = \
	$(platform-conf-vars)

stripfiles = \
	$(prefix)/bin/avconv \
	$(prefix)/bin/avplay \
	$(prefix)/bin/avprobe \
	$(prefix)/bin/avserver \
	$(prefix)/bin/ffmpeg

stripfiles += \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/vhook/*.so
