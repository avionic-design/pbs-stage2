PACKAGE = minicom
VERSION = 2.2

LOCATION = http://alioth.debian.org/download.php/1806
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = friendly menu-driven serial communication program

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install
	$(priv) $(INSTALL) -d $(ROOTFS)/etc/minicom
	$(priv) $(INSTALL) packages/$(package)/minirc.dfl $(ROOTFS)/etc/minicom

