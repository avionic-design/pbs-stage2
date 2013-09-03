ARCH := $(subst $(quote),,$(CONFIG_ARCH))
OS := $(subst $(quote),,$(CONFIG_OS))
LIBC := $(subst $(quote),,$(CONFIG_LIBC))

TARGET := $(ARCH)-unknown-$(OS)-$(LIBC)
export TARGET

#
# default flags
#

CPPFLAGS = --sysroot $(SYSROOT)
export CPPFLAGS

CFLAGS = $(CPPFLAGS) $(ABIFLAGS) $(OPTFLAGS)
export CFLAGS

LDFLAGS = --sysroot $(SYSROOT)
export LDFLAGS
