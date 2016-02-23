include packages/libs/librpc/Makefile.location
include packages/build-tools/autotools.mk

CPPFLAGS = -Wno-error=cpp

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	ac_cv_prog_XSLTPROC=no

conf-args += \
	--disable-werror

prunefiles = \
	$(prefix)/lib/librpc.la
