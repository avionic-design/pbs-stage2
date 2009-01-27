PACKAGE = groff
VERSION = 1.20.1

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = GNU troff text-formatting system

##############################################################################

include packages/common.mk

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

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) ln -sf tbl $(ROOTFS)$(prefix)/bin/gtbl

prunefiles =
stripfiles = \
	$(prefix)/bin/addftinfo \
	$(prefix)/bin/eqn \
	$(prefix)/bin/grn \
	$(prefix)/bin/grodvi \
	$(prefix)/bin/groff \
	$(prefix)/bin/grolbp \
	$(prefix)/bin/grolj4 \
	$(prefix)/bin/grops \
	$(prefix)/bin/grotty \
	$(prefix)/bin/hpftodit \
	$(prefix)/bin/indxbib \
	$(prefix)/bin/lkbib \
	$(prefix)/bin/lookbib \
	$(prefix)/bin/pfbtops \
	$(prefix)/bin/pic \
	$(prefix)/bin/post-grohtml \
	$(prefix)/bin/preconv \
	$(prefix)/bin/pre-grohtml \
	$(prefix)/bin/refer \
	$(prefix)/bin/soelim \
	$(prefix)/bin/tbl \
	$(prefix)/bin/tfmtodit \
	$(prefix)/bin/troff

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@

