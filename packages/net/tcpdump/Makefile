PACKAGE = tcpdump
VERSION = 3.9.5

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

env = env -i

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--disable-smb \
	ac_cv_linux_vers=2 \
	$(call set-args, CC CFLAGS LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

BUILD_ARGS = \
	CFLAGS='$(CFLAGS) -include config.h -I. -D_U_="__attribute__((unused))"' \
	LDFLAGS='$(LDFLAGS) -ldl'

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

