ARCH = i686
OS = linux
LIBC = gnu
TARGET = $(ARCH)-pc-$(OS)-$(LIBC)
export ARCH OS LIBC TARGET

include platform/toolchain/common.mk

ifndef TOOLCHAIN
platform-clean-dirs  += $(PLATFORM)$(tprefix)
platform-clean-dirs  += $(builddir)
platform-clean-files += $(PLATFORM)/kernel-version
platform-clean-files += $(PLATFORM)/kernel-release

include platform/cleanup.mk

PHONY += platform-clean
platform-clean: platform-cleanup
	@:

.PHONY: $(PHONY)
endif

