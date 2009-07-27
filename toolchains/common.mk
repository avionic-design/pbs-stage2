# release versions
LINUX_VERSION		= 2.6.30.3
BINUTILS_VERSION	= 2.19.1
GCC_VERSION		= 4.4.1

# snapshot versions
BINUTILS_SNAPSHOT	= 2.19.51.0.9

# C library versions
newlib_VERSION		= 1.16.0
uclibc_VERSION		= 0.9.30.1
glibc_VERSION		= 2.9

SYSROOT	= $(CURDIR)
prefix	= /usr
variant	= sysroot
export SYSROOT prefix variant

clean-dirs  := build include scripts
clean-files := .depends kernel-release kernel-version
