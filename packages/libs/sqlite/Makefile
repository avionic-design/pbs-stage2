PACKAGE = sqlite
VERSION = 3.6.6.2

LOCATION = http://www.sqlite.org
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc

conf-vars = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)"

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

_install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

prunefiles = \
	$(prefix)/lib/libsqlite3.la

stripfiles = \
	$(prefix)/bin/sqlite3 \
	$(prefix)/lib/libsqlite3.so.0.8.6

include packages/cleanup.mk

package-install: _install _cleanup
	@:

package-clean:
	@:

