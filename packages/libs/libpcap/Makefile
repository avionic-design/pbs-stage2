PACKAGE = libpcap
VERSION = 0.9.5

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include packages/common.mk

env = env -i

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--with-pcap=linux \
	--enable-ipv6 \
	--enable-shared \
	ac_cv_linux_vers=2 \
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

