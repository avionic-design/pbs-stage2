PACKAGE = tremor
VERSION = trunk

LOCATION_SVN = http://svn.xiph.org/trunk/Tremor/

include packages/autotools-reconf.mk

pkgbuildtree := $(pkgtree)/source

conf-args += \
	--enable-low-accuracy \
	--disable-oggtest

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
