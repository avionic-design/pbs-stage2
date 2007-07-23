CORE_PREFIX = $(PLATFORM)/bootstrap
BUILD = $(shell echo $$MACHTYPE)
PATH = $(PLATFORM)/usr/bin:$(CORE_PREFIX)/bin:/usr/bin:/bin
env = PATH=$(PATH)

