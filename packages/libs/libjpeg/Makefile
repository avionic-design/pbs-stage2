PACKAGE = libjpeg
VERSION = 6b

LOCATION = ftp://ftp.uu.net/graphics/jpeg
TARBALLS = jpegsrc.v$(VERSION).tar.gz

##############################################################################

include packages/common.mk

ARCH := $(shell echo $(CONFIG_ARCH))
pkgbuildtree := $(pkgtree)/jpeg-6b

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--sysconfdir=/etc

conf-args += \
	--enable-shared

conf-vars = \
	CC='$(CC)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
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

prunefiles = \
	$(prefix)/lib/libjpeg.la

stripfiles = \
	$(prefix)/bin/jpegtran \
	$(prefix)/bin/wrjpgcom \
	$(prefix)/bin/djpeg \
	$(prefix)/bin/cjpeg \
	$(prefix)/bin/rdjpgcom \
	$(prefix)/lib/libjpeg.so.62.0.0

include packages/cleanup.mk

$(pkgtree)/.binary: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-install \
			-a $(ARCH) -s $(DESTDIR)
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-binary \
			-a $(ARCH) -v $(VERSION)
	$(call cmd,stamp)

$(pkgtree)/.install: $(pkgtree)/.binary
	cd $(pkgsrctree) && \
		$(priv) $(srctree)/scripts/pbs-extract \
			-a $(ARCH) -v $(VERSION) -r $(ROOTFS)
	$(call cmd,stamp)
