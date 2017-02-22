include packages/libs/librpc/Makefile.location
include packages/autotools.mk

conf-args += \
	--disable-werror \
	--disable-docs

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/rpc-stubgen \
	$(prefix)/lib/*.so.*
