PACKAGE = ncurses
VERSION = 5.7

LOCATION = ftp://ftp.gnu.org/gnu/ncurses
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

##############################################################################

include packages/common.mk

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

$(pkgtree)/.binary:
	@echo "$@: not implemented yet"
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(ROOTFS)

$(pkgtree)/.do-install: $(pkgtree)/.binary
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

sover = 5.7

prunefiles =
stripfiles = \
	$(prefix)/bin/clear \
	$(prefix)/bin/infocmp \
	$(prefix)/bin/tic \
	$(prefix)/bin/toe \
	$(prefix)/bin/tput \
	$(prefix)/bin/tset \
	$(prefix)/lib/libform.so.$(sover) \
	$(prefix)/lib/libmenu.so.$(sover) \
	$(prefix)/lib/libncurses.so.$(sover) \
	$(prefix)/lib/libpanel.so.$(sover)

include packages/cleanup.mk

$(pkgtree)/.install: $(pkgtree)/.do-install $(pkgtree)/.cleanup
	$(call cmd,stamp)
