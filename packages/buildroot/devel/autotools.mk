include packages/buildroot/devel/common.mk
include packages/buildroot/autotools.mk

conf-args += \
	--host=$(shell $(CC) -dumpmachine)

conf-vars += \
	$(call set-args, $(CROSS_TOOLS))

