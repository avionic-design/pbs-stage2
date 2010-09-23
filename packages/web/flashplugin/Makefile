PACKAGE = flashplugin
VERSION = 10

LOCATION = http://fpdownload.macromedia.com/get/flashplayer/current
TARBALLS = install_flash_player_$(VERSION)_linux.tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(env) $(priv) $(INSTALL) -m 755 -d $(DESTDIR)$(prefix)/lib/mozilla/plugins
	$(env) $(priv) $(INSTALL) -m 755 $(pkgtree)/libflashplayer.so \
		$(DESTDIR)$(prefix)/lib/mozilla/plugins
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
