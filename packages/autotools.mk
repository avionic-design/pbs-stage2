include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--sysconfdir=/etc \
	$(call set-args, CC CFLAGS LD LDFLAGS)

autotools-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
autotools-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

autotools-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install

package-configure: package-pre-configure autotools-configure package-post-configure
package-build: package-pre-build autotools-build package-post-build
package-install: package-pre-install autotools-install package-post-install

# dummy targets that can be overridden
package-pre-configure:
package-post-configure:
package-pre-build:
package-post-build:
package-pre-install:
package-post-install:

