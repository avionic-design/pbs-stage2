TARGET  = $(CONFIG_ARCH)-

ifneq ($(CONFIG_CPU),)
  TARGET += $(CONFIG_CPU)-
endif

TARGET += $(CONFIG_OS)-
TARGET += $(CONFIG_LIBC)

ifneq ($(CONFIG_ABI),)
  TARGET += $(CONFIG_ABI)
endif

