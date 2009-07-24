-include include/config/auto.conf

LIBC := $(shell echo $(CONFIG_LIBC))

ifeq ($(LIBC),gnu)
  LIBC := glibc
endif

obj-y += gmp
obj-y += mpfr
obj-y += linux-headers
obj-y += $(LIBC)-headers
obj-y += binutils
obj-y += gcc-core
obj-y += $(LIBC)
obj-y += gcc
obj-y += $(LIBC)-cleanup
obj-y += gdb
obj-y += pkg-config

obj-$(CONFIG_PACKAGE_TOOLCHAIN_LIBFLOAT) += libfloat
obj-$(CONFIG_PACKAGE_TOOLCHAIN_MINGWRT) += mingwrt
obj-$(CONFIG_PACKAGE_TOOLCHAIN_NEWLIB) += newlib
obj-$(CONFIG_PACKAGE_TOOLCHAIN_W32API) += w32api
