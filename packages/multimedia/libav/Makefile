PACKAGE = libav
VERSION = 9.10

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
