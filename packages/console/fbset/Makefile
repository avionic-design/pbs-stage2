PACKAGE = fbset
VERSION = 2.1

LOCATION = http://users.telenet.be/geertu/Linux/fbdev
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

PATCHFILES = \
	$(DISTNAME)-install-into-destdir.patch

include packages/common.mk

build-args = $(call set-args, CC CFLAGS LDFLAGS)
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(DESTDIR)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

