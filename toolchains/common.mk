# release versions
LINUX_VERSION		= 2.6.32.4
BINUTILS_VERSION	= 2.20
GCC_VERSION		= 4.4.2

# snapshot versions
BINUTILS_SNAPSHOT	= 2.19.51.0.9

# C library versions
newlib_VERSION		= 1.16.0
uclibc_VERSION		= 0.9.30.2
glibc_VERSION		= 2.11

SYSROOT	= $(CURDIR)
prefix	= /usr
variant	= sysroot
export SYSROOT prefix variant

clean-dirs  := build include scripts
clean-files := .config.old .depends
clean-files += kernel-release kernel-version

mrproper-dirs  :=
mrproper-files :=

distclean-dirs  := usr
distclean-files :=
