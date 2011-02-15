PACKAGE = MPlayer
VERSION = 1.0rc4

LOCATION = http://www.mplayerhq.hu/MPlayer/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

TARGET_PLATFORM := $(patsubst i786-%,i686-%,$(TARGET))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--enable-runtime-cpudetection \
	--target=$(TARGET_PLATFORM) \
	--enable-cross-compile \
	--prefix=$(prefix) \
	--confdir=/etc/mplayer \
	--host-cc=gcc \
	--cc=$(CC) \
	--as=$(AS) \
	--nm=$(NM) \
	--ar=$(AR)

conf-args += \
	--extra-cflags='$(CFLAGS)' \
	--extra-ldflags='$(LDFLAGS)'

conf-args += \
	--disable-iconv \
	--disable-live \
	--enable-xv \
	--enable-xvmc

ifeq ($(CONFIG_CPU),xscale)
conf-args += \
	--enable-armv5te \
	--enable-iwmmxt
endif

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree) && \
		cd $(pkgbuildtree) && \
			$(env) ./configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args += \
	-j $(NUM_CPU)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/mencoder \
	$(prefix)/bin/mplayer

include packages/cleanup.mk
include packages/binary.mk
