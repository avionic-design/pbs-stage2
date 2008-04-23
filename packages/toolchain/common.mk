CORE_PREFIX = $(PLATFORM)/bootstrap
BUILD = $(shell echo $$MACHTYPE)
PATH = $(PLATFORM)/usr/bin:$(CORE_PREFIX)/bin:/usr/bin:/bin
prefix = /opt/cross
priv = sudo
env = PATH=$(PATH)

