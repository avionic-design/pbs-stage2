PACKAGE = ebtables
VERSION = 2.0.10-4
LICENSE = GPL

LOCATION = http://freefr.dl.sourceforge.net/project/$(PACKAGE)/$(PACKAGE)/$(PACKAGE)-$(subst .,-,$(VERSION))
TARBALLS = $(PACKAGE)-v$(VERSION).tar.gz

include packages/common.mk

pkgbuildtree := $(pkgtree)/$(PACKAGE)-v$(VERSION)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	PREFIX=$(prefix) \
	EXTRA_CFLAGS='$(CFLAGS)' \
	EXTRA_LDFLAGS='$(LDFLAGS)' \
	CC='$(CC)' V=1

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	PREFIX=$(prefix) \
	INSTALL_MAN=$(prefix)/share/man

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/ibebt_802_3.so \
	$(prefix)/lib/libebtable_broute.so \
	$(prefix)/lib/libebtable_filter.so \
	$(prefix)/lib/libebtable_nat.so \
	$(prefix)/lib/libebt_among.so \
	$(prefix)/lib/libebt_arpreply.so \
	$(prefix)/lib/libebt_arp.so \
	$(prefix)/lib/libebtc.so \
	$(prefix)/lib/libebt_ip6.so \
	$(prefix)/lib/libebt_ip.so \
	$(prefix)/lib/libebt_limit.so \
	$(prefix)/lib/libebt_log.so \
	$(prefix)/lib/libebt_mark_m.so \
	$(prefix)/lib/libebt_mark.so \
	$(prefix)/lib/libebt_nat.so \
	$(prefix)/lib/libebt_nflog.so \
	$(prefix)/lib/libebt_pkttype.so \
	$(prefix)/lib/libebt_redirect.so \
	$(prefix)/lib/libebt_standard.so \
	$(prefix)/lib/libebt_stp.so \
	$(prefix)/lib/libebt_ulog.so \
	$(prefix)/lib/libebt_vlan.so \
	$(prefix)/bin/ebtables \
	$(prefix)/bin/ebtables-restore

include packages/cleanup.mk
include packages/binary.mk
