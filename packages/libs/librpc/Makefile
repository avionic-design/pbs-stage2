include packages/libs/librpc/Makefile.location
include packages/autotools.mk

conf-vars += \
	ac_cv_prog_XSLTPROC=no

conf-args += \
	--disable-werror

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/rpc-stubgen \
	$(prefix)/lib/*.so.*
