ARCH := $(shell echo $(CONFIG_ARCH))
OS   := $(shell echo $(CONFIG_OS))
LIBC := $(shell echo $(CONFIG_LIBC))

ifeq ($(LIBC),glibc)
  LIBC := gnu
endif

TARGET := $(ARCH)-$(OS)-$(LIBC)
export TARGET
