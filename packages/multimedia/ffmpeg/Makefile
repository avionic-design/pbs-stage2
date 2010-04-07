PACKAGE = ffmpeg
VERSION = 0.5.1

LOCATION = http://ffmpeg.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET)
	$(call cmd,stamp)

conf-args = \
	--prefix=$(prefix) \
	--cross-prefix=$(TARGET)- \
	--enable-cross-compile \
	--sysroot=$(ROOTFS) \
	--enable-shared \
	--enable-gpl \
	--enable-postproc \
	--enable-swscale \
	--disable-stripping

conf-vars =

$(pkgtree)/.configure:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/ffmpeg \
	$(prefix)/bin/ffserver \
	$(prefix)/lib/libavcodec.so.52.20.1 \
	$(prefix)/lib/libavdevice.so.52.1.0 \
	$(prefix)/lib/libavformat.so.52.31.0 \
	$(prefix)/lib/libavutil.so.49.15.0 \
	$(prefix)/lib/libpostproc.so.51.2.0 \
	$(prefix)/lib/libswscale.so.0.7.1 \
	$(prefix)/lib/vhook/*.so

include packages/cleanup.mk
include packages/binary.mk
