PACKAGE = vlc
VERSION = 1.0.5

LOCATION = http://download.videolan.org/pub/videolan/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--without-libiconv-prefix \
	--enable-run-as-root \
	--disable-a52 \
	--disable-dvdnav \
	--disable-libgcrypt \
	--disable-qt4 \
	--disable-remoteosd \
	--disable-rpath \
	--disable-sdl \
	--disable-skins2 \
	--disable-static

conf-vars += \
	am_cv_func_iconv=yes \
	am_cv_lib_iconv=yes \
	am_cv_func_iconv_works=yes

plugin = $(prefix)/lib/vlc

prunefiles = \
	$(prefix)/lib/libvlccore.la \
	$(prefix)/lib/libvlc.la \
	$(plugin)/access/*.la \
	$(plugin)/access_output/*.la \
	$(plugin)/audio_filter/*.la \
	$(plugin)/audio_mixer/*.la \
	$(plugin)/audio_output/*.la \
	$(plugin)/codec/*.la \
	$(plugin)/control/*.la \
	$(plugin)/demux/*.la \
	$(plugin)/meta_engine/*.la \
	$(plugin)/misc/*.la \
	$(plugin)/mux/*.la \
	$(plugin)/packetizer/*.la \
	$(plugin)/services_discovery/*.la \
	$(plugin)/stream_filter/*.la \
	$(plugin)/stream_out/*.la \
	$(plugin)/video_chroma/*.la \
	$(plugin)/video_filter/*.la \
	$(plugin)/video_output/*.la \
	$(plugin)/visualization/*.la

stripfiles = \
	$(prefix)/bin/vlc \
	$(prefix)/bin/vlc-wrapper \
	$(prefix)/lib/libvlccore.so.2.1.1 \
	$(prefix)/lib/libvlc.so.2.2.1 \
	$(plugin)/access/*.so \
	$(plugin)/access_output/*.so \
	$(plugin)/audio_filter/*.so \
	$(plugin)/audio_mixer/*.so \
	$(plugin)/audio_output/*.so \
	$(plugin)/codec/*.so \
	$(plugin)/control/*.so \
	$(plugin)/demux/*.so \
	$(plugin)/meta_engine/*.so \
	$(plugin)/misc/*.so \
	$(plugin)/mux/*.so \
	$(plugin)/packetizer/*.so \
	$(plugin)/services_discovery/*.so \
	$(plugin)/stream_filter/*.so \
	$(plugin)/stream_out/*.so \
	$(plugin)/video_chroma/*.so \
	$(plugin)/video_filter/*.so \
	$(plugin)/video_output/*.so \
	$(plugin)/visualization/*.so
