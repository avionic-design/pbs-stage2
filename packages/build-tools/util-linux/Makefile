include packages/core/util-linux/Makefile.location
include packages/build-tools/autotools.mk

conf-args += \
	--disable-nls \
	--disable-all-programs \
	--without-python \
	--enable-libblkid \
	--enable-libfdisk \
	--enable-libmount \
	--enable-libmount-support-mtab \
	--enable-libsmartcols \
	--enable-libuuid

prunefiles = \
	$(prefix)/lib/*.la
