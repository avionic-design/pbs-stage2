PACKAGE = flashplugin

VERSION = 11.2.202.228

# 11.2 beta 5
#VERSION = 11.2.202.197
#PATCH = p5
#REV = 013112
# VERSION = 10.2.152.27
# The 11.1 and 11.2 beta releases don't work properly with YouTube videos.
# Only the top-half of the video is displayed.
#VERSION = 11.1.102.55
#VERSION = 11.1.102.62
# 11.2 beta 3
#VERSION = 11.2.202.160
#  PATCH = p3
#    REV = 122011

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

ARCH = $(call unquote,$(CONFIG_ARCH))

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

ifeq ($(PATCH)$(REV),)
  LOCATION = http://fpdownload.macromedia.com/get/flashplayer/pdc/$(VERSION)
  ifeq ($(MAJOR),11)
    TARBALLS = install_flash_player_$(MAJOR)_linux.$(FLASH_ARCH).tar.gz
  else
    TARBALLS = install_flash_player_$(MAJOR)_linux.tar.gz
  endif
else
  LOCATION = http://download.macromedia.com/pub/labs/flashplatformruntimes/flashplayer$(MAJOR)-$(MINOR)
  TARBALLS = flashplayer$(MAJOR)-$(MINOR)_$(PATCH)_install_lin_$(BITS)_$(REV).tar.gz
  # Use this instead to install the Flash content debugger
  #TARBALLS = flashplayer$(MAJOR)-$(MINOR)_$(PATCH)_debug_lin_$(BITS)_$(REV).tar.gz
endif

include packages/common.mk

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
