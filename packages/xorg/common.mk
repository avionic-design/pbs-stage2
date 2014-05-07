LOCATION ?= http://xorg.freedesktop.org/releases/individual/$(SUBDIR)
TARBALLS ?= $(PACKAGE)-$(VERSION).tar.bz2

BUILD_SCRIPT_DIR ?= packages
BUILD_SCRIPT ?= autotools.mk
include $(BUILD_SCRIPT_DIR)/$(BUILD_SCRIPT)
