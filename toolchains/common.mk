# release versions
LINUX_VERSION		= 2.6.30
BINUTILS_VERSION	= 2.19.1
GCC_VERSION		= 4.3.3

# snapshot versions
BINUTILS_SNAPSHOT	= 2.19.51.0.9

# C library versions
newlib_VERSION		= 1.16.0
uclibc_VERSION		= 0.9.30.1
glibc_VERSION		= 2.9

SYSROOT	= $(CURDIR)
TARGET	= $(target)
prefix	= /usr
variant	= sysroot
export SYSROOT TARGET prefix variant

obj-y := packages/toolchain/gmp
obj-y += packages/toolchain/mpfr
obj-y += packages/toolchain/linux-headers
obj-y += packages/toolchain/$(LIBC)-headers
obj-y += packages/toolchain/binutils
obj-y += packages/toolchain/gcc-core
obj-y += packages/toolchain/$(LIBC)
obj-y += packages/toolchain/gcc
obj-y += packages/toolchain/$(LIBC)-cleanup
obj-y += packages/toolchain/gdb
obj-y += packages/toolchain/pkg-config
