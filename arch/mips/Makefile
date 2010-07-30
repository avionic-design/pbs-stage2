ARCH := $(subst $(quote),,$(CONFIG_ARCH))
OS := $(subst $(quote),,$(CONFIG_OS))
LIBC := $(subst $(quote),,$(CONFIG_LIBC))

ifeq ($(LIBC),glibc)
  LIBC := gnu
endif

TARGET := $(ARCH)-$(OS)-$(LIBC)
export TARGET
