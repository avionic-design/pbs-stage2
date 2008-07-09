PACKAGE = icu4c
VERSION = 4.0d02

LOCATION = http://download.icu-project.org/files/icu4c/4.0
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/common.mk

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info

conf-vars = \
	CC_FOR_BUILD=gcc \
	CXX_FOR_BUILD=g++ \
	CFLAGS_FOR_BUILD='-O2 -g' \
	CXXFLAGS_FOR_BUILD='-O2 -g'

package-configure:
	mkdir -p $(pkgtree)/obj-$(TARGET) && \
		cd $(pkgtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)

build-args =

package-build:
	cd $(pkgtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pktree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install

package-clean:
	@:

