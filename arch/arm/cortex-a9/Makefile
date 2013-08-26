OPTFLAGS := -g -O2 -marm -march=armv7-a -mtune=cortex-a9 -Uarm

ifeq ($(CONFIG_ARCH_TEGRA_3x_SOC),y)
OPTFLAGS += -mfpu=neon
else
OPTFLAGS += -mfpu=vfpv3-d16
endif
