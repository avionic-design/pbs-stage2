PACKAGE = binutils
VERSION = 2.18

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/buildroot/toolchain/autotools.mk

env = env -i PATH=$(ROOTFS)$(bootstrap-prefix)/bin:${PATH}

# FIXME: this is still rather ugly, but it forces HOST and BUILD to be
#        different so the tools will be cross-compiled
conf-args += \
	--build=$(shell echo $(BUILD) | sed 's/unknown-//;s/pc-//')

ifneq ($(HOST), $(TARGET))
  conf-args := \
	--target=$(TARGET) \
	--host=$(HOST) \
	$(conf-args)
endif

conf-args += \
	--program-prefix=$(TARGET)- \
	--disable-nls

package-clean:
	@:

