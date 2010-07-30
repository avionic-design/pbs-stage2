ARCH := $(subst $(quote),,$(CONFIG_ARCH))
OS := $(subst $(quote),,$(CONFIG_OS))
LIBC := $(subst $(quote),,$(CONFIG_LIBC))

ifeq ($(ARCH),blackfin)
  ARCH := bfin
endif

TARGET := $(ARCH)-$(OS)-$(LIBC)
export TARGET
