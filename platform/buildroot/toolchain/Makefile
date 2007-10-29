ROOTFS = $(abspath $(PLATFORM)/../rootfs)
export ROOTFS

ifndef target
  $(error need to specify the toolchain target)
endif

ifneq ($(wildcard $(PLATFORM)/configs/$(target).mk),)
  include $(PLATFORM)/configs/$(target).mk
else
  $(warning using generic configuration)
  include $(PLATFORM)/configs/generic.mk
endif

ifeq ($(LIBC),gnu)
  LIBC-name = glibc
else
  LIBC-name = $(LIBC)
endif

# build a target toolchain
packages-y += buildroot/toolchain/binutils-core
packages-y += buildroot/toolchain/gcc-core
packages-y += buildroot/toolchain/linux-headers
packages-y += buildroot/toolchain/$(LIBC-name)
packages-y += buildroot/toolchain/gcc-target
packages-y += buildroot/toolchain/gcc-final
packages-y += buildroot/toolchain/binutils-final

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean: __clean-dirs += $(ROOTFS)/toolchain
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

