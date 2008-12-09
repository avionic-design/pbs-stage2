ARCH = arm
ARCH_LONG = armv4t
CPU = xscale
TUNE = strongarm110
OS = wince
LIBC = newlib
FLOAT = soft
ABI = pe
TARGET = $(ARCH)-$(OS)-$(ABI)
export ARCH ARCH_LONG CPU TUNE OS LIBC FLOAT ABI TARGET

variant = sysroot
export variant

include platform/toolchain/common.mk
packages-y  = toolchain/binutils
#packages-y += toolchain/newlib
packages-y += toolchain/gcc-core
#packages-y += toolchain/mingwrt
#packages-y += toolchain/w32api

ifndef TOOLCHAIN
PHONY += platform-clean
platform-clean: __clean-dirs  += $(PLATFORM)$(tprefix)
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-files += $(PLATFORM)/kernel-version
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)
endif

