BUILD = $(shell echo $$MACHTYPE)
HOST = $(shell echo $$MACHTYPE)

prefix := $(ROOTFS)$(prefix)
PATH   := $(prefix)/bin:$(PATH)
ROOTFS :=

env = PATH=$(PATH)
export prefix PATH ROOTFS priv env

