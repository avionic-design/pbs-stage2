PACKAGE = ifdokrfid
VERSION = 2.7.0

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

drivers = $(prefix)/lib/pcsc/drivers
bundle = $(drivers)/ifdokrfid.bundle

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(priv) mkdir -p $(DESTDIR)$(bundle)/Contents/Linux && \
		$(priv) cp $(pkgsrctree)/ifdokrfid.so \
			$(DESTDIR)$(bundle)/Contents/Linux && \
		$(priv) chmod 0755 $(DESTDIR)$(bundle)/Contents/Linux/ifdokrfid.so && \
		$(priv) cp $(pkgsrctree)/Info.plist \
			$(DESTDIR)$(bundle)/Contents
	$(call cmd,stamp)

stripfiles = \
	$(bundle)/Contents/Linux/ifdokrfid.so

include packages/cleanup.mk
include packages/binary.mk
