include packages/libs/pcre/Makefile.location
include packages/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(pkgbuildtree)/m4

conf-args += \
	--enable-unicode-properties

config-scriptfiles = \
	$(prefix)/bin/pcre-config

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/pcregrep \
	$(prefix)/bin/pcretest \
	$(prefix)/lib/*.so.*
