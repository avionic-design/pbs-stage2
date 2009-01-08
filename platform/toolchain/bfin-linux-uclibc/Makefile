ARCH = blackfin
CPU = bfin
OS = linux
LIBC = uclibc
TARGET = $(CPU)-$(OS)-$(LIBC)
export ARCH CPU OS LIBC TARGET

variant = sysroot
export variant

include platform/toolchain/common.mk

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

