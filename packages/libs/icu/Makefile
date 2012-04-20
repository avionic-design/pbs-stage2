include packages/libs/icu/Makefile.location
include packages/autotools.mk

pkgbuildtree := $(pkgtree)/icu/source

cross-build = $(objtree)/build/packages/build-tools/icu/icu/source

conf-args += \
	--with-cross-build=$(cross-build)/obj-$(BUILD_GNU_TYPE)

stripfiles = \
	$(prefix)/bin/derb \
	$(prefix)/bin/genbrk \
	$(prefix)/bin/gencfu \
	$(prefix)/bin/gencnval \
	$(prefix)/bin/genctd \
	$(prefix)/bin/genrb \
	$(prefix)/bin/icuinfo \
	$(prefix)/bin/makeconv \
	$(prefix)/bin/pkgdata \
	$(prefix)/bin/uconv \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/genccode \
	$(prefix)/sbin/gencmn \
	$(prefix)/sbin/gennorm2 \
	$(prefix)/sbin/gensprep \
	$(prefix)/sbin/icupkg \
