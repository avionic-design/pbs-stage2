PACKAGE = nvidia-tegra2-flashplayer
VERSION = 10.2r157-nv3

LOCATION = http://ftp.avionic-design.de/nvidia/source/vibrante
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	mkdir -p $(DESTDIR) && \
		cp -R $(pkgtree)/$(PACKAGE)-$(VERSION)/* $(DESTDIR)
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
