PACKAGE = libav
VERSION = 0.8.1

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
	--enable-shared \
	--enable-gpl \
	--enable-postproc \
	--enable-swscale \
	--disable-encoders \
	--disable-doc \
	$(platform-conf-args)

conf-vars = \
	$(platform-conf-vars)

stripfiles = \
	$(prefix)/bin/avconv \
	$(prefix)/bin/ffmpeg \
	$(prefix)/bin/ffplay \
	$(prefix)/bin/ffprobe \
	$(prefix)/bin/ffserver

stripfiles += \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/vhook/*.so
