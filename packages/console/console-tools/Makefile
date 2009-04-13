PACKAGE = console-tools
VERSION = 0.4.0-rc1-wip

LOCATION =
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

DESCRIPTION =

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
	CFLAGS='$(CFLAGS)'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-do-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

sover = 0.0.0

prunefiles = \
	$(prefix)/lib/libctconsole.la \
	$(prefix)/lib/libctgeneric.la \
	$(prefix)/lib/libctlocal.la \
	$(prefix)/lib/libctutils.la

stripfiles = \
	$(prefix)/bin/dumpkeys \
	$(prefix)/bin/loadkeys \
	$(prefix)/lib/libctconsole.so.$(sover) \
	$(prefix)/lib/libctgeneric.so.$(sover) \
	$(prefix)/lib/libctlocal.so.$(sover) \
	$(prefix)/lib/libctutils.so.$(sover)

include packages/cleanup.mk

package-install: package-do-install package-cleanup
	@:

package-clean:
	@:

