include packages/libs/gettext/Makefile.location
include packages/build-tools/autotools.mk

# we only need the tools for build-tools.
pkgbuildtree := $(pkgbuildtree)/gettext-tools

conf-args += \
	--disable-openmp \
	--disable-rpath \
	--disable-java \
	--disable-native-java \
	--disable-acl \
	--disable-csharp \
	--without-emacs

prunefiles = \
	$(prefix)/lib/libgettextlib.la \
	$(prefix)/lib/libgettextpo.la \
	$(prefix)/lib/libgettextsrc.la
