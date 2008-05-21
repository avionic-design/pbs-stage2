include packages/common.mk

conf-args += \
	--host=$(TARGET) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--sysconfdir=/etc

# strip libraries and binaries
conf-vars += \
	$(call set-args, CC CFLAGS LD LDFLAGS)

autotools-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args +=
build-vars +=

autotools-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args) $(build-vars)

install-args +=
install-vars += \
	DESTDIR=$(ROOTFS)

autotools-install:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) $(install-vars) install

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

