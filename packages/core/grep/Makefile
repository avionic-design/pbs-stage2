include packages/core/grep/Makefile.location
include packages/autotools.mk

ifneq ($(LIBC),gnu)
conf-vars += \
	ac_cv_func_mempcpy=no
endif

stripfiles = \
	$(prefix)/bin/grep
