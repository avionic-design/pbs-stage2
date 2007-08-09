PACKAGE = strace
VERSION = 4.5.15

LOCATION = http://heanet.dl.sourceforge.net/sourceforge/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

PATCHFILES = \
	$(DISTNAME)-fix-arm-bad-syscall.patch

DESCRIPTION = a system call tracer

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

