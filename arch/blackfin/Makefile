ARCH := $(shell echo $(CONFIG_ARCH))
OS := $(shell echo $(CONFIG_OS))
LIBC := $(shell echo $(CONFIG_LIBC))

ifeq ($(ARCH),blackfin)
  ARCH := bfin
endif

TARGET := $(ARCH)-$(OS)-$(LIBC)
export TARGET
