PACKAGE = sysklogd
VERSION = 1.4.1

LOCATION = http://www.infodrom.org/projects/sysklogd/download
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

PATCHFILES = \
	$(DISTNAME)-debian.patch \
	$(DISTNAME)-dont-strip-on-install.patch

include packages/common.mk

env      = env -i
priv     = sudo
CFLAGS  += -DSYSV
LDFLAGS := $(CFLAGS) $(LDFLAGS)

build-args = \
	$(call set-args, CC CFLAGS LDFLAGS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	BINDIR=$(ROOTFS)/usr/sbin \
	MANDIR=$(ROOTFS)/usr/share/man

package-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) install

