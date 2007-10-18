# common definitions for autotools-based packages

include packages/buildroot/devel/common.mk

ifdef HOST
  autotools-subdir ?= obj-$(HOST)
else
  autotools-subdir ?= build
endif

ifeq ($(findstring noconf,$(PBS_OPTS)),)

# buildroot/devel is *always* cross-compiled
ifneq ($(HOST), $(BUILD))
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

autotools-configure:
	mkdir -p $(pkgtree)/$(autotools-subdir) && \
		cd $(pkgtree)/$(autotools-subdir) && \
			$(env) ../configure $(conf-args) $(conf-vars)

package-pre-configure:
package-configure: package-pre-configure autotools-configure package-post-configure
package-post-configure:
endif

ifeq ($(findstring nobuild,$(PBS_OPTS)),)
build-args +=
build-vars += \
	DESTDIR=$(ROOTFS)

autotools-build:
	cd $(pkgtree)/$(autotools-subdir) && \
		$(env) $(MAKE) $(build-args) $(build-vars)

package-pre-build:
package-build: package-pre-build autotools-build package-post-build
package-post-build:
endif

ifeq ($(findstring noinst,$(PBS_OPTS)),)
install-args +=
install-vars += \
	DESTDIR=$(ROOTFS)

autotools-install:
	cd $(pkgtree)/$(autotools-subdir) && \
		$(env) $(MAKE) $(install-args) $(install-vars) \
			$(if $(install-targets),$(install-targets),install)

package-pre-install:
package-install: package-pre-install autotools-install package-post-install
package-post-install:
endif

