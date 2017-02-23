include packages/libs/pcre/Makefile.location
include packages/build-tools/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(pkgbuildtree)/m4

conf-args += \
	--enable-unicode-properties

prunefiles = \
	$(prefix)/lib/*.la
