include packages/libs/libxslt/Makefile.location
include packages/autotools-reconf.mk

$(pkgbuildtree)/m4:
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(pkgbuildtree)/m4

conf-args += \
	--without-crypto \
	--without-python

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/xsltproc \
	$(prefix)/lib/*.so.*
