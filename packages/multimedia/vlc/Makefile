PACKAGE = vlc
VERSION = 2.0.7
LICENSE = GPL

LOCATION = http://download.videolan.org/pub/videolan/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-vars += \
	CXXFLAGS='$(CPPFLAGS)'

conf-args += \
	--enable-run-as-root \
	--disable-rpath \
	--disable-a52 \
	--disable-dvdnav \
	--disable-libgcrypt \
	--disable-lua \
	--disable-notify \
	--disable-qt4 \
	--disable-skins2 \
	--disable-neon \
	--disable-glx \
	--disable-postproc \
	--disable-dbus

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_SPEEX),y)
  conf-args += --disable-speex
endif

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_VLC_VAAPI),y)
  conf-args += --disable-libva
else
  conf-args += --enable-libva
endif

plugin = $(prefix)/lib/vlc/plugins

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/3dnow/*.la \
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
	$(plugin)/mmx/*.la \
	$(plugin)/mmxext/*.la \
	$(plugin)/mux/*.la \
	$(plugin)/notify/*.la \
	$(plugin)/packetizer/*.la \
	$(plugin)/services_discovery/*.la \
	$(plugin)/sse2/*.la \
	$(plugin)/stream_filter/*.la \
	$(plugin)/stream_out/*.la \
	$(plugin)/text_renderer/*.la \
	$(plugin)/video_chroma/*.la \
	$(plugin)/video_filter/*.la \
	$(plugin)/video_output/*.la \
	$(plugin)/visualization/*.la

stripfiles = \
	$(prefix)/bin/vlc \
	$(prefix)/bin/vlc-wrapper \
	$(prefix)/lib/*.so.* \
	$(plugin)/3dnow/*.so \
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
	$(plugin)/mmx/*.so \
	$(plugin)/mmxext/*.so \
	$(plugin)/mux/*.so \
	$(plugin)/notify/*.so \
	$(plugin)/packetizer/*.so \
	$(plugin)/services_discovery/*.so \
	$(plugin)/sse2/*.so \
	$(plugin)/stream_filter/*.so \
	$(plugin)/stream_out/*.so \
	$(plugin)/text_renderer/*.so \
	$(plugin)/video_chroma/*.so \
	$(plugin)/video_filter/*.so \
	$(plugin)/video_output/*.so \
	$(plugin)/visualization/*.so \
	$(prefix)/lib/vlc/vlc-cache-gen
