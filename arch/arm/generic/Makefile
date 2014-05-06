OPTFLAGS := -g -Os

ifneq ($(CONFIG_MARCH),"")
  OPTFLAGS += -march=$(call unquote,$(CONFIG_MARCH))
endif
