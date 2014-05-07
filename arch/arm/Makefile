include arch/common.mk

CPPFLAGS += -Uarm

#
# ABI flags
#

ABIFLAGS-$(CONFIG_ARCH_ARM_ENDIAN_BIG) += -mbig-endian
ABIFLAGS-$(CONFIG_ARCH_ARM_ENDIAN_LITTLE) += -mlittle-endian

ABIFLAGS-$(CONFIG_ARCH_ARM_FPU_VFP) += -mfpu=vfp
ABIFLAGS-$(CONFIG_ARCH_ARM_FPU_VFPV3) += -mfpu=vfpv3
ABIFLAGS-$(CONFIG_ARCH_ARM_FPU_VFPV3_D16) += -mfpu=vfpv3-d16
ABIFLAGS-$(CONFIG_ARCH_ARM_FPU_NEON) += -mfpu=neon
ABIFLAGS-$(CONFIG_ARCH_ARM_FPU_VFPV4) += -mfpu=vfpv4
ABIFLAGS-$(CONFIG_ARCH_ARM_FPU_VFPV4_D16) += -mfpu=vfpv4-d16
ABIFLAGS-$(CONFIG_ARCH_ARM_FPU_NEON_VFP4) += -mfpu=neon-vfpv4

ABIFLAGS-$(CONFIG_ARCH_ARM_FLOAT_ABI_HARDFP) += -mfloat-abi=hard -D__ARM_PCS_VFP
ABIFLAGS-$(CONFIG_ARCH_ARM_FLOAT_ABI_SOFTFP) += -mfloat-abi=softfp -mapcs
ABIFLAGS-$(CONFIG_ARCH_ARM_FLOAT_ABI_SOFT) += -mfloat-abi=soft

ABIFLAGS-$(CONFIG_ARCH_ARM_ABI_EABI) += -mabi=aapcs-linux -mno-thumb-interwork

ABIFLAGS += -marm

#
# CPU specific configuration
#

cpu-$(CONFIG_ARCH_ARM_CPU_GENERIC) := arch/arm/generic/Makefile
cpu-$(CONFIG_ARCH_ARM_CPU_XSCALE) := arch/arm/xscale/Makefile
cpu-$(CONFIG_ARCH_ARM_CPU_CORTEX_A9) := arch/arm/cortex-a9/Makefile
include $(cpu-y)
