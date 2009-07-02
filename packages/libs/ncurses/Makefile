PACKAGE = ncurses
VERSION = 5.7

LOCATION = ftp://ftp.gnu.org/gnu/ncurses
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

##############################################################################

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

conf-args += \
	--with-shared

conf-vars = \
	CXXFLAGS='$(CXXFLAGS)' \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure:
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args =

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

sover = 5.7

prunefiles = \
	$(prefix)/bin/ncurses5-config

stripfiles = \
	$(prefix)/bin/captoinfo \
	$(prefix)/bin/clear \
	$(prefix)/bin/infocmp \
	$(prefix)/bin/infotocap \
	$(prefix)/bin/reset \
	$(prefix)/bin/tic \
	$(prefix)/bin/toe \
	$(prefix)/bin/tput \
	$(prefix)/bin/tset \
	$(prefix)/lib/libform.so.$(sover) \
	$(prefix)/lib/libmenu.so.$(sover) \
	$(prefix)/lib/libncurses.so.$(sover) \
	$(prefix)/lib/libpanel.so.$(sover)

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
