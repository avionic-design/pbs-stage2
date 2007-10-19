HOST   ?= $(shell support/config.guess)
BUILD  ?= $(HOST)
TARGET ?= $(HOST)

ARCH      = $(shell echo $(HOST) | cut -d- -f1)
ARCH_LONG = $(ARCH)
CPU       = $(shell echo $(HOST) | cut -d- -f2)
TUNE      = $(CPU)
OS        = $(shell echo $(HOST) | cut -d- -f3)
LIBC      = $(shell echo $(HOST) | cut -d- -f4)
FLOAT     =
ABI       =

export ARCH ARCH_LONG CPU TUNE OS LIBC FLOAT HOST

LINUX_VERSION = 2.6.23.1
GCC_VERSION   = 4.2.2
export LINUX_VERSION GCC_VERSION

