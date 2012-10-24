PACKAGE = wpa_supplicant
VERSION = 1.0-rc2
SNAPSHOT = git20120302

LOCATION = http://hostap.epitest.fi/releases
TARBALLS = $(PACKAGE)-$(VERSION).$(SNAPSHOT).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree)/wpa_supplicant && \
		echo "CC = $(CC)" >> .config && \
		echo "CFLAGS += $(CFLAGS)" >> .config && \
		echo "LDFLAGS += $(LDFLAGS)" >> .config && \
		echo "BINDIR = $(prefix)/sbin" >> .config && \
		echo "LIBDIR = $(prefix)/lib" >> .config && \
		echo "SYSTEMDUNITDIR = /usr/lib/systemd/system" >> .config && \
		echo "SYSCONFDIR = /etc" >> .config && \
		echo "DATADIR = $(prefix)/share" >> .config
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/wpa_supplicant && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/wpa_supplicant && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/wpa_cli \
	$(prefix)/sbin/wpa_passphrase \
	$(prefix)/sbin/wpa_supplicant

include packages/cleanup.mk
include packages/binary.mk
