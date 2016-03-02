include packages/devel/flex/Makefile.location
include packages/autotools.mk

conf-args += \
	--disable-documentation \
	--disable-examples \
	--disable-tests

stripfiles = \
	$(prefix)/bin/flex \
	$(prefix)/lib/*.so.*

prunefiles = \
	$(prefix)/lib/libfl.la \
	$(prefix)/lib/libfl_pic.la
