OPTFLAGS := -g -Os

ifneq ($(ARCH_LONG),)
  OPTFLAGS += -march=$(ARCH_LONG)
endif

ifneq ($(ARCH),)
  OPTFLAGS += -U$(ARCH)
endif
