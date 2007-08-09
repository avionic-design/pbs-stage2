include packages/common.mk

env += PATH=$(TOOLCHAIN_ROOT)/usr/bin:$(PATH)

conf-args += \
	--host=$(HOST) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--sysconfdir=/etc

conf-vars +=

autotools-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args) $(conf-vars)

build-args +=
build-vars +=

autotools-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) $(build-vars)

install-args +=
install-vars += \
	DESTDIR=$(ROOTFS)

autotools-install:
	cd $(pkgtree) && $(priv) $(env) $(MAKE) $(install-args) $(install-vars) install

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

