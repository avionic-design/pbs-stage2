PACKAGE = webkitgtk
VERSION = 2.14.3
LICENSE = LGPL BSD

LOCATION = http://www.webkitgtk.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

# Version for supporting Webkit1 API
VERSION_OLD_API = 2.4.9

VERSION_MAJOR = $(word 1, $(subst ., ,$(VERSION)))
VERSION_MINOR = $(word 2, $(subst ., ,$(VERSION)))

GT = $(shell if [ $(1) -gt $(2) ] ; then echo y ; else echo n ; fi)
EQ = $(shell if [ $(1) -eq $(2) ] ; then echo y ; else echo n ; fi)

ifneq ($(MAKECMDGOALS),watch)

  ifeq ($(CONFIG_PACKAGE_WEB_WEBKIT_GTK_ENABLE_WEBKIT1),y)
    VERSION = $(VERSION_OLD_API)
  endif

  # Stick to 1.10.2 for L4T due to gstreamer-0.10 dependencies for video
  # playback
  ifeq ($(CONFIG_PACKAGE_VENDOR_NVIDIA_TEGRA2_L4T),y)
    VERSION = 1.10.2
  endif

  USE_CMAKE=n
  # cmake build system from 2.5.0 on
  ifeq ($(call GT,$(VERSION_MAJOR),2),y)
    USE_CMAKE=y
  else
    ifeq ($(call EQ,$(VERSION_MAJOR),2),y)
      ifeq ($(call GT,$(VERSION_MINOR),4),y)
        USE_CMAKE=y
      endif
    endif
  endif

  ifeq ($(USE_CMAKE),y)
    include packages/web/webkit-gtk/Makefile.cmake
  else
    include packages/web/webkit-gtk/Makefile.automake
  endif
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/* \
	$(prefix)/lib/$(PACKAGE)/WebKitPluginProcess \
	$(prefix)/lib/$(PACKAGE)/WebKitWebProcess \
	$(prefix)/lib/*.so.*

ifeq ($(USE_CMAKE),y)
  stripfiles += $(prefix)/libexec/webkit2gtk-4.0/*
else
  stripfiles += $(prefix)/libexec/webkit2gtk-3.0/*
endif
