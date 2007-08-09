PACKAGE = netcat
VERSION = 0.7.1

LOCATION = ftp://heanet.dl.sourceforge.net/n/ne/netcat
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	$(call set-args, CC CFLAGS LDFLAGS)

package-configure:
	cp support/config.{guess,sub} $(pkgtree)
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

