PACKAGE = psmisc
VERSION = 22.3

LOCATION = http://mesh.dl.sourceforge.net/sourceforge/psmisc
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

DESCRIPTION = utilities that use the proc filesystem

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--mandir=\$${prefix}/share/man \
	--infodir=\$${prefix}/share/info \
	$(call set-args, CC CFLAGS LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

