PACKAGE = gtk+
VERSION = 2.10.13

LOCATION = ftp://ftp.gtk.org/pub/gtk/v2.10
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--with-gdktarget=linux-fb \
	--enable-fbmanager \
	$(call set-args, CC CFLAGS LD LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

