PACKAGE = ffmpeg
VERSION = 0.7.8

LOCATION = http://ffmpeg.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

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
	--disable-stripping \
	--disable-encoders \
	--disable-doc \
	$(platform-conf-args)

conf-vars = \
	$(platform-conf-vars)

stripfiles = \
	$(prefix)/bin/ffmpeg \
	$(prefix)/bin/ffplay \
	$(prefix)/bin/ffprobe \
	$(prefix)/bin/ffserver \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/vhook/*.so
