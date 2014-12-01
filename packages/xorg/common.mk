LOCATION ?= http://xorg.freedesktop.org/releases/individual/$(SUBDIR)
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

BUILD_SCRIPT_DIR ?= packages
BUILD_SCRIPT ?= autotools.mk
include $(BUILD_SCRIPT_DIR)/$(BUILD_SCRIPT)

ifeq ($(CONFIG_LIBC),gnu)
conf-vars += \
	xorg_cv_malloc0_returns_null=no
else
conf-vars += \
	xorg_cv_malloc0_returns_null=yes
endif
