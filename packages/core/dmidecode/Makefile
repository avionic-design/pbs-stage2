PACKAGE = dmidecode
VERSION = 2.10

LOCATION = http://download.savannah.gnu.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	DESTDIR=$(DESTDIR) \
	prefix=$(prefix)

$(pkgtree)/.build:
	cd $(pkgbuildtree) && $(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	prefix=$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/sbin/biosdecode \
	$(prefix)/sbin/dmidecode \
	$(prefix)/sbin/ownership \
	$(prefix)/sbin/vpddecode

include packages/cleanup.mk
include packages/binary.mk
