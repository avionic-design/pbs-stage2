ARCH = blackfin
CPU = bfin
OS = linux
LIBC = uclibc
TARGET = $(CPU)-$(OS)-$(LIBC)
export ARCH CPU OS LIBC TARGET

#LINUX_VERSION     = 2.6.25.4
BINUTILS_VERSION  = snapshot
#BINUTILS_SNAPSHOT = 2.18.50.0.7
GCC_VERSION       = snapshot
#GCC_SNAPSHOT      = 4.3-20080606
LIBC_VERSION      = snapshot
#LIBC_SNAPSHOT     =

#export LINUX_VERSION
#export BINUTILS_VERSION BINUTILS_SNAPSHOT
#export GCC_VERSION GCC_SNAPSHOT
#export LIBC_VERSION LIBC_SNAPSHOT

variant = sysroot
export variant

include platform/toolchain/common.mk

ifndef TOOLCHAIN
PHONY += platform-clean
platform-clean: __clean-dirs  += $(PLATFORM)/bootstrap
platform-clean: __clean-dirs  += $(PLATFORM)/lib
platform-clean: __clean-dirs  += $(PLATFORM)/usr
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)
endif

