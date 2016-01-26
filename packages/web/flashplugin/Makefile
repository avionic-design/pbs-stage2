PACKAGE = flashplugin
VERSION = 11.2.202.559
LICENSE = proprietary

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

include packages/common.mk

ifeq ($(ARCH),x86)
  FLASH_ARCH = i386
  BITS = 32
else
  ifeq ($(ARCH),x86_64)
    FLASH_ARCH = x86_64
    BITS = 64
  else
    $(error Flash Plugin is only supported on x86 and x86_64)
  endif
endif

LOCATION = http://fpdownload.macromedia.com/get/flashplayer/pdc/$(VERSION)
TARBALLS = install_flash_player_$(MAJOR)_linux.$(FLASH_ARCH).tar.gz

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(env) $(priv) $(INSTALL) -m 755 -d $(DESTDIR)$(prefix)/lib/mozilla/plugins
	$(env) $(priv) $(INSTALL) -m 755 $(pkgtree)/libflashplayer.so \
		$(DESTDIR)$(prefix)/lib/mozilla/plugins
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
