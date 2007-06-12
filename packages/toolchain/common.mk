PATH = $(PLATFORM)/usr/bin:/usr/bin:/bin
env = PATH=$(PATH)
CORE_PREFIX = $(PLATFORM)/bootstrap
BUILD = $(shell echo $$MACHTYPE)

