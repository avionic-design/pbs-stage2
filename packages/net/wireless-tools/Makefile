PACKAGE = wireless-tools
VERSION = 29

LOCATION = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
TARBALLS = $(subst -,_,$(PACKAGE)).$(VERSION).tar.gz

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(subst -,_,$(PACKAGE)).$(VERSION)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	EXTRA_LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	INSTALL_MAN=$(DESTDIR)$(prefix)/share/man \
	PREFIX=$(DESTDIR)$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/ifrename \
	$(prefix)/sbin/iwconfig \
	$(prefix)/sbin/iwevent \
	$(prefix)/sbin/iwgetid \
	$(prefix)/sbin/iwlist \
	$(prefix)/sbin/iwpriv \
	$(prefix)/sbin/iwspy \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
