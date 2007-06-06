PACKAGE = glibc
VERSION = 2.6

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

CROSS_COMPILE = $(PLATFORM)/usr/bin/$(HOST)-
ADDR2LINE = $(CROSS_COMPILE)addr2line
AR = $(CROSS_COMPILE)ar
AS = $(CROSS_COMPILE)as
CPPFILT = $(CROSS_COMPILE)c++filt
LD = $(CROSS_COMPILE)ld
NM = $(CROSS_COMPILE)nm
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump
RANLIB = $(CROSS_COMPILE)ranlib
READELF = $(CROSS_COMPILE)readelf
SIZE = $(CROSS_COMPILE)size
STRINGS = $(CROSS_COMPILE)strings
STRIP = $(CROSS_COMPILE)strip

configure_env = \
	CROSS_COMPILE='$(CROSS_COMPILE)' \
	ADDR2LINE='$(ADDR2LINE)' \
	AR='$(AR)' \
	AS='$(AS)' \
	CPPFILT='$(CPPFILT)' \
	LD='$(LD)' \
	NM='$(NM)' \
	OBJCOPY='$(OBJCOPY)' \
	OBJDUMP='$(OBJDUMP)' \
	RANLIB='$(RANLIB)' \
	READELF='$(READELF)' \
	SIZE='$(SIZE)' \
	STRINGS='$(STRINGS)' \
	STRIP='$(STRIP)'

env = PATH=/usr/bin:/bin:$(PLATFORM)/usr/bin

package-configure:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	cd $(pkgtree) && mkdir -p obj-$(HOST) && cd obj-$(HOST) && \
		$(env) ../configure --host=$(HOST) --prefix=/usr --without-cvs \
			--disable-sanity-checks --enable-hacker-mode \
			--enable-addons=ports --enable-tls \
			--with-sysroot=$(PLATFORM) \
			--with-headers=$(PLATFORM)/usr/include

package-build:

package-install:
	cd $(pkgtree)/obj-$(HOST) && $(MAKE) cross-compiling=yes \
		install_root=$(PLATFORM) CFLAGS=-DBOOTSTRAP_GCC \
		install_headers

