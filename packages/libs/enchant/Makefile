PACKAGE = enchant
VERSION = 1.5.0

LOCATION = http://www.abisource.com/downloads/enchant/1.5.0
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	mkdir $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build:
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

plugin = $(prefix)/lib/enchant

prunefiles = \
	$(prefix)/lib/libenchant.la \
	$(plugin)/libenchant_ispell.a \
	$(plugin)/libenchant_ispell.la \
	$(plugin)/libenchant_myspell.a \
	$(plugin)/libenchant_myspell.la \
	$(plugin)/libenchant_zemberek.a \
	$(plugin)/libenchant_zemberek.la

stripfiles = \
	$(prefix)/bin/enchant \
	$(prefix)/bin/enchant-lsmod \
	$(prefix)/lib/libenchant.so.1.5.0 \
	$(plugin)/libenchant_ispell.so \
	$(plugin)/libenchant_myspell.so \
	$(plugin)/libenchant_zemberek.so

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install:
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
