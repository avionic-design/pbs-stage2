PACKAGE = fbset
VERSION = 2.1

LOCATION = http://users.telenet.be/geertu/Linux/fbdev
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	mkdir -p $(DESTDIR)/usr/sbin \
		 $(DESTDIR)/usr/share/man/man5 \
		 $(DESTDIR)/usr/share/man/man8 && \
		cd $(pkgbuildtree) &&  \
		$(priv) $(env) $(MAKE) $(install-args) install

stripfiles = \
	$(prefix)/sbin/fbset

include packages/cleanup.mk
include packages/binary.mk
