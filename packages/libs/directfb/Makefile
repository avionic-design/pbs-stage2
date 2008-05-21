PACKAGE = DirectFB
VERSION = 1.1.1

LOCATION = http://www.directfb.org/downloads/Core
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

env = env -i PATH=$(TOOLCHAIN_ROOT)/usr/bin:${PATH}

conf-args = \
	--host=$(TARGET) \
	--prefix=/usr \
	--infodir=\$${prefix}/share/info \
	--mandir=\$${prefix}/share/man \
	--sysconfdir=/etc

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =
build-vars =

package-build:

install-args =
install-vars =

package-install:

package-clean:
	@:

