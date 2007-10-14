# common definitions for autotools-based packages

include packages/buildroot/core/common.mk

ifdef HOST
  autotools-subdir ?= obj-$(HOST)
else
  autotools-subdir ?= build
endif

ifeq ($(findstring noconf,$(PBS_OPTS)),)

ifeq ($(HOST), $(BUILD))
  conf-args += \
	--build=$(BUILD)
else
  conf-args += \
	--build=$(BUILD) \
	--host=$(HOST)
endif

#ifeq ($(PACKAGE),glibc)
#  dest-prefix = $(prefix)
#else
  dest-prefix = $(ROOTFS)$(prefix)
#endif

conf-args += \
	--prefix=$(dest-prefix) \
	--infodir=$(dest-prefix)/share/info \
	--mandir=$(dest-prefix)/share/man \
	--sysconfdir=$(dest-prefix)/etc

conf-vars +=

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
build-vars +=

autotools-build:
	cd $(pkgtree)/$(autotools-subdir) && \
		$(env) $(MAKE) $(build-args) $(build-vars)

package-pre-build:
package-build: package-pre-build autotools-build package-post-build
package-post-build:
endif

ifeq ($(findstring noinst,$(PBS_OPTS)),)
install-args +=
install-vars +=

autotools-install:
	cd $(pkgtree)/$(autotools-subdir) && \
		$(env) $(MAKE) $(install-args) $(install-vars) \
			$(if $(install-targets),$(install-targets),install)

package-pre-install:
package-install: package-pre-install autotools-install package-post-install
package-post-install:
endif

