include packages/buildroot/common.mk

HOST   ?= $(shell support/config.guess)
BUILD  ?= $(HOST)
TARGET ?= $(HOST)
ARCH   ?= $(shell echo $(TARGET) | cut -d- -f1)

