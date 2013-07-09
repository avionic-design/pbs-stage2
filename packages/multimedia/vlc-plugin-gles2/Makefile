PACKAGE = vlc-plugin-gles2
VERSION = 0.1.2
LICENSE = GPL

LOCATION = ftp.avionic-design.de/pub/vlc-plugin-gles2
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

plugindir = \
	$(prefix)/lib/vlc/plugins/video_output

prunefiles += \
	$(plugindir)/*.la

stripfiles += \
	$(plugindir)/*.so
