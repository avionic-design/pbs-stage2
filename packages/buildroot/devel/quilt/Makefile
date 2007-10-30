PACKAGE = quilt
VERSION = 0.46

LOCATION = http://download.savannah.gnu.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/buildroot/devel/common.mk

env = env -i PATH=${PATH}

ifneq ($(BUILD), $(HOST))
  conf-args += \
	--build=$(BUILD)
endif

conf-args += \
	--host=$(HOST) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=$(prefix)/etc

conf-vars += \
	$(call set-args, $(CROSS_TOOLS)) \
	$(call set-args, $(CROSS_FLAGS))

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args) $(conf-vars)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) $(build-vars)

install-args += \
	install

install-vars += \
	BUILD_ROOT=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) $(install-vars)

package-clean:
	@:

