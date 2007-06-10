PACKAGE = dash
VERSION = 0.5.3

LOCATION = http://gondor.apana.org.au/~herbert/dash/files
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

conf-args = \
	--prefix=/usr \
	--mandir=/usr/share/man \
	--infodir=/usr/share/info

package-configure:
	cd $(pkgtree) && $(env) ./configure --host=$(HOST) --build=$(BUILD) \
		$(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE)

install-args = \
	DESTDIR=$(PLATFORM)/rootfs

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

