PACKAGE = Thunar
VERSION = 1.0.2

LOCATION = http://mocha.xfce.org/archive/src/xfce/thunar/1.0
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

plugin = $(prefix)/lib/thunarx-1

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/Thunar \
	$(prefix)/libexec/thunar-sendto-email \
	$(prefix)/libexec/thunar-vfs-font-thumbnailer-1 \
	$(prefix)/libexec/thunar-vfs-mime-cleaner-1 \
	$(prefix)/libexec/thunar-vfs-pixbuf-thumbnailer-1 \
	$(prefix)/libexec/thunar-vfs-update-thumbnailers-cache1 \
	$(prefix)/libexec/xfce4/panel-plugins/thunar-tpa \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
