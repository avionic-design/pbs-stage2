# release versions
LINUX_VERSION		= 2.6.30.2
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

clean-dirs  := include scripts
clean-files := .depends
