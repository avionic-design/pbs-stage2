PACKAGE = nvidia-tegra2-egl
VERSION = 19.0026

LOCATION = ftp://ftp.avionic-design.de/pub/$(PACKAGE)
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
